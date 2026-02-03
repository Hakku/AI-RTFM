---
type: technical_documentation
kernel: techdoc
title: Production Deployment Procedure for Order Service
owner: @jsmith
created: 2026-03-15
last_updated: 2026-04-18
review_cycle: 30_days
status: active
tags: [order-service, kubernetes, helm, deploy, production, critical, oncall]
---

# Production Deployment Procedure for Order Service

## Overview

This document describes the complete procedure for deploying the order-service microservice to the production Kubernetes cluster. This process includes pre-deployment checks, database migrations, deployment via Helm, and post-deployment verification.

**Use this procedure when:**
- Deploying a new version of order-service to production
- Rolling back to a previous version
- After successful staging deployment and testing

**Estimated time:** 30-45 minutes (including verification)

## Prerequisites

Before starting this deployment, ensure you have:

- [ ] Change request approved (CRQ number required)
- [ ] Code merged to `main` branch
- [ ] CI/CD pipeline passed all tests (green build)
- [ ] Staging deployment successful and verified
- [ ] Database migration tested in staging
- [ ] On-call engineer notified and available
- [ ] Access to production kubectl context
- [ ] Access to production AWS console
- [ ] Helm 3.8+ installed locally
- [ ] kubectl 1.24+ installed locally

**Required permissions:**
- Kubernetes: `production-deployer` role
- AWS: `ProductionReadOnly` + `EKSDeployer`
- Vault: `production-secrets-read`

**Required information:**
- Git commit SHA to deploy
- CRQ number (format: CRQ-YYYY-NNNN)
- Rollback plan (previous version number)

## Procedure

### Step 1: Verify Prerequisites

**Set kubectl context to production:**
```bash
kubectl config use-context production-eks-cluster
```

**Expected output:**
```
Switched to context "production-eks-cluster".
```

**Verify you're in the right cluster:**
```bash
kubectl cluster-info
```

**Expected output:**
```
Kubernetes control plane is running at https://XXXXX.eks.amazonaws.com
```

⚠️ **CRITICAL:** Make absolutely sure you're in production context before proceeding!

**Verification:**
- [ ] Context shows "production" in the name
- [ ] Cluster URL matches production
- [ ] No warning messages about certificates

### Step 2: Check Current Service Status

**Get current deployment info:**
```bash
kubectl get deployment order-service -n production
```

**Expected output:**
```
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
order-service   3/3     3            3           45d
```

**Note current version:**
```bash
kubectl get deployment order-service -n production -o jsonpath='{.spec.template.spec.containers[0].image}'
```

**Expected output:**
```
registry.company.com/order-service:v2.14.3
```

**Record this version for rollback:** `v2.14.3`

### Step 3: Pre-deployment Health Check

**Check pod health:**
```bash
kubectl get pods -n production -l app=order-service
```

**Expected output:**
```
NAME                             READY   STATUS    RESTARTS   AGE
order-service-7d8f5b4c9-abc12    1/1     Running   0          2d
order-service-7d8f5b4c9-def34    1/1     Running   0          2d
order-service-7d8f5b4c9-ghi56    1/1     Running   0          2d
```

**All pods must show:**
- READY: 1/1
- STATUS: Running
- Low RESTARTS count (<5)

**Check recent logs for errors:**
```bash
kubectl logs -n production -l app=order-service --tail=50 | grep -i error
```

**Expected:** No critical errors in last 50 lines

### Step 4: Database Migration (if required)

⚠️ **Skip this step if no database changes in this release**

**Check if migration needed:**
```bash
# Review release notes
cat releases/v2.15.0-CHANGELOG.md | grep -i "migration"
```

**If migration required, run migration job:**
```bash
kubectl apply -f k8s/migration-job-v2.15.0.yaml
```

**Monitor migration:**
```bash
kubectl logs -n production -f job/order-service-migration-v2-15-0
```

**Wait for completion:**
```bash
kubectl wait --for=condition=complete --timeout=600s job/order-service-migration-v2-15-0 -n production
```

**Expected output:**
```
job.batch/order-service-migration-v2-15-0 condition met
```

**Verify migration success:**
```bash
kubectl logs -n production job/order-service-migration-v2-15-0 | tail -20
```

**Expected:** Should see "Migration completed successfully" or similar

**Verification:**
- [ ] Migration job status: Completed
- [ ] No error messages in logs
- [ ] Database changes verified (check with `psql` if needed)

### Step 5: Update Helm Values

**Get current Helm values:**
```bash
helm get values order-service -n production > current-values.yaml
```

**Update image tag in values file:**
```bash
# Edit the values file
vim helm-values/production.yaml

# Change:
image:
  tag: v2.14.3

# To:
image:
  tag: v2.15.0
```

**Verify the change:**
```bash
git diff helm-values/production.yaml
```

**Commit the change:**
```bash
git add helm-values/production.yaml
git commit -m "deploy: update order-service to v2.15.0 (CRQ-2026-1234)"
git push origin main
```

### Step 6: Deploy with Helm

**Perform dry-run first:**
```bash
helm upgrade order-service ./helm/order-service \
  -n production \
  -f helm-values/production.yaml \
  --dry-run --debug
```

**Review the output carefully:**
- Check image tag is correct: `v2.15.0`
- Verify resource limits unchanged
- Confirm replica count: 3

**If dry-run looks good, deploy:**
```bash
helm upgrade order-service ./helm/order-service \
  -n production \
  -f helm-values/production.yaml \
  --wait --timeout 10m
```

**Expected output:**
```
Release "order-service" has been upgraded. Happy Helming!
NAME: order-service
LAST DEPLOYED: Sat Apr 18 14:30:15 2026
NAMESPACE: production
STATUS: deployed
REVISION: 47
```

**Note the REVISION number:** 47 (needed for rollback if issues)

### Step 7: Monitor Rollout

**Watch pod rollout:**
```bash
kubectl rollout status deployment/order-service -n production
```

**Expected output:**
```
Waiting for deployment "order-service" rollout to finish: 1 out of 3 new replicas have been updated...
Waiting for deployment "order-service" rollout to finish: 2 out of 3 new replicas have been updated...
Waiting for deployment "order-service" rollout to finish: 3 old replicas are pending termination...
deployment "order-service" successfully rolled out
```

**Watch pods in real-time:**
```bash
watch kubectl get pods -n production -l app=order-service
```

**Expected progression:**
1. New pods created: ContainerCreating
2. New pods ready: Running (1/1)
3. Old pods terminated one by one
4. Final state: 3 new pods Running

Press `Ctrl+C` to exit watch when all 3 new pods are running.

### Step 8: Health Check New Pods

**Check pod status:**
```bash
kubectl get pods -n production -l app=order-service
```

**Expected output:**
```
NAME                             READY   STATUS    RESTARTS   AGE
order-service-9c7f8d5e2-xyz89    1/1     Running   0          2m
order-service-9c7f8d5e2-abc12    1/1     Running   0          2m
order-service-9c7f8d5e2-def34    1/1     Running   0          1m
```

**Verify version deployed:**
```bash
kubectl exec -n production deployment/order-service -- /app/order-service --version
```

**Expected output:**
```
order-service version v2.15.0 (commit: abc123def456)
```

**Check application logs:**
```bash
kubectl logs -n production -l app=order-service --tail=100
```

**Look for:**
- ✅ "Application started successfully"
- ✅ "Connected to database"
- ✅ "Ready to accept requests"
- ❌ No ERROR or FATAL messages

## Verification

After deployment completes, verify the system is working correctly:

### 1. Check Service Health Endpoint
```bash
kubectl run curl-test --image=curlimages/curl:latest --rm -it --restart=Never -- \
  curl http://order-service.production.svc.cluster.local:8080/health
```

**Expected response:**
```json
{
  "status": "healthy",
  "version": "v2.15.0",
  "database": "connected",
  "timestamp": "2026-04-18T14:35:20Z"
}
```

### 2. Test Order Creation (Smoke Test)
```bash
# Use staging API to create test order in production
curl -X POST https://api.company.com/v1/orders \
  -H "Authorization: Bearer $PROD_TEST_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "customer_id": "test-customer-001",
    "items": [{"sku": "TEST-001", "quantity": 1}],
    "test": true
  }'
```

**Expected response:**
```json
{
  "order_id": "ord_abc123",
  "status": "created",
  "created_at": "2026-04-18T14:36:00Z"
}
```

### 3. Check Monitoring Dashboards

**Open these dashboards and verify normal metrics:**

1. **Grafana:** https://grafana.company.com/d/order-service-prod
   - [ ] Request rate similar to pre-deployment
   - [ ] Error rate <0.1%
   - [ ] P95 latency <500ms
   - [ ] No spike in 5xx errors

2. **DataDog:** https://app.datadoghq.com/dashboard/order-service
   - [ ] All pods reporting metrics
   - [ ] CPU usage normal (<70%)
   - [ ] Memory usage stable

3. **CloudWatch:** Order Service Logs
   - [ ] No ERROR level logs
   - [ ] Normal request patterns

### 4. Check Dependent Services

**Verify no impact on payment service:**
```bash
kubectl get pods -n production -l app=payment-service
```

**All pods should be:** Running (no restarts)

**Verify no impact on notification service:**
```bash
kubectl logs -n production -l app=notification-service --tail=50 | grep -i "order-service"
```

**Expected:** Normal API calls, no connection errors

### 5. Customer Impact Check

**Check recent support tickets:**
- [ ] No new P1/P2 tickets related to orders
- [ ] Check #customer-support Slack for complaints

**Check status page:**
- [ ] https://status.company.com → All systems operational

## Troubleshooting

### Issue: Pods stuck in CrashLoopBackOff

**Symptoms:**
- Pod STATUS shows `CrashLoopBackOff`
- Pod RESTARTS count increasing

**Check logs:**
```bash
kubectl logs -n production -l app=order-service --previous
```

**Common causes:**
1. **Database connection failed**
   - Check: DB credentials in secrets
   - Check: Database is accessible from cluster
   - Fix: Update secret, restart pods

2. **Migration not completed**
   - Check: Migration job status
   - Fix: Complete migration, then redeploy

**Solution:** Follow rollback procedure below

### Issue: High error rate after deployment

**Symptoms:**
- Grafana shows >1% error rate
- Increased 5xx responses

**Check logs for errors:**
```bash
kubectl logs -n production -l app=order-service | grep ERROR
```

**Common causes:**
1. **API compatibility issue**
   - Check: Frontend version compatible?
   - Fix: May need to rollback

2. **External service timeout**
   - Check: Payment service responding?
   - Fix: Investigate dependent service

**Solution:** If errors persist >5 minutes → Rollback

### Issue: Deployment timeout

**Symptoms:**
- `helm upgrade` hangs or times out
- Pods not reaching Running state

**Check pod events:**
```bash
kubectl describe pod -n production -l app=order-service
```

**Common causes:**
1. **Image pull failed**
   - Check: Image exists in registry?
   - Check: Image pull secrets valid?

2. **Resource limits too low**
   - Check: OOMKilled events?
   - Fix: Increase memory limits

**Solution:** Cancel deployment and fix underlying issue

## Rollback Procedure

If issues are detected and cannot be quickly resolved, rollback immediately:

### Quick Rollback (Helm)

**Rollback to previous revision:**
```bash
# Get revision number from Step 6 (was: 47, so rollback to 46)
helm rollback order-service 46 -n production --wait
```

**Expected output:**
```
Rollback was a success! Happy Helming!
```

**Verify rollback:**
```bash
kubectl get deployment order-service -n production -o jsonpath='{.spec.template.spec.containers[0].image}'
```

**Expected:** Should show previous version `v2.14.3`

### Manual Rollback (if Helm fails)

**Rollback deployment:**
```bash
kubectl rollout undo deployment/order-service -n production
```

**Monitor rollback:**
```bash
kubectl rollout status deployment/order-service -n production
```

### Rollback Database Migration

⚠️ **Only if migration was part of deployment**

**Run rollback migration:**
```bash
kubectl apply -f k8s/migration-rollback-v2.15.0.yaml
kubectl wait --for=condition=complete --timeout=300s job/order-service-migration-rollback-v2-15-0 -n production
```

**Verify:**
```bash
kubectl logs job/order-service-migration-rollback-v2-15-0 -n production
```

## Notes

**Important considerations:**

- **Timing:** Best to deploy during low-traffic hours (2-4 AM EST)
- **Communication:** Notify in #deployments Slack channel before starting
- **Monitoring:** Watch dashboards closely for 30 minutes post-deployment
- **Rollback decision:** If unsure, rollback. Better safe than sorry.
- **Documentation:** Update this runbook if you encounter new issues

**Dependencies:**
- Database: PostgreSQL 14 on AWS RDS
- Message queue: RabbitMQ cluster
- Cache: Redis cluster
- External API: Payment Gateway (3rd party)

**SLA Impact:**
- Zero-downtime deployment (rolling update)
- Brief traffic routing adjustment (<5 seconds)
- No expected user impact

## Related Documentation

- [Order Service Architecture](../adr/0015-order-service-design.md)
- [Database Migration Guide](./database-migrations.md)
- [Kubernetes Troubleshooting](./k8s-troubleshooting.md)
- [Rollback Procedures](./rollback-procedures.md)
- [Incident Response Plan](../incidents/incident-response-plan.md)

## Maintenance

**Review Schedule:** Every 30 days or after significant changes

**Last Reviewed By:** @jsmith on 2026-04-18

**Changelog:**
- 2026-04-18: Updated for v2.15.0 deployment, added migration steps
- 2026-03-20: Added DataDog dashboard link
- 2026-03-15: Initial creation based on v2.14.0 deployment
- 2026-02-10: Added rollback database migration procedure

**Next Review:** 2026-05-18