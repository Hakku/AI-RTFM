# Tag Taxonomy

> Controlled vocabulary for consistent document tagging

**Last updated:** 2026-01-30

---

## Overview

All documents must use tags from this controlled vocabulary. Consistent tagging enables:
- Fast search and filtering
- Gap analysis ("what systems lack documentation?")
- AI discoverability (llms.txt generation)
- Compliance reporting

## Required Tags

Every document MUST have at least one tag from each required category:

| Category | Required | Description |
|----------|----------|-------------|
| `system` | Yes | What system/service is this about? |
| `action` | Yes | What operation does this document describe? |
| `doctype` | Auto | Set by template (runbook, incident, adr, kb, api, change, onboard, security, compliance, iac, dr, concept) |

## Tag Categories

### Systems (`system:`)

Infrastructure and services. Use the most specific applicable tag.

**Databases:**
- `postgresql` - PostgreSQL database
- `mongodb` - MongoDB database
- `redis` - Redis cache/store
- `mysql` - MySQL database
- `elasticsearch` - Elasticsearch/OpenSearch

**Infrastructure:**
- `kubernetes` - Kubernetes/K8s/EKS/GKE
- `docker` - Docker containers
- `aws` - AWS general (use specific service if applicable)
- `aws-rds` - AWS RDS specifically
- `aws-ec2` - AWS EC2 specifically
- `aws-s3` - AWS S3 specifically
- `nginx` - NGINX web server/proxy
- `rabbitmq` - RabbitMQ message queue
- `kafka` - Apache Kafka

**Applications:**
- `order-service` - Order management service
- `user-service` - User/authentication service
- `payment-service` - Payment processing service
- `notification-service` - Notification service
- `api-gateway` - API gateway

**Networking:**
- `vpn` - VPN connectivity
- `dns` - DNS configuration
- `ssl` - SSL/TLS certificates
- `firewall` - Firewall rules
- `load-balancer` - Load balancing

**Tools:**
- `helm` - Helm charts
- `terraform` - Terraform IaC
- `ansible` - Ansible automation
- `jenkins` - Jenkins CI/CD
- `gitlab-ci` - GitLab CI/CD
- `datadog` - Datadog monitoring
- `grafana` - Grafana dashboards

---

### Actions (`action:`)

What operation or purpose does this document serve?

**Operations:**
- `deploy` - Deployment procedures
- `restart` - Restart/reboot procedures
- `backup` - Backup procedures
- `restore` - Restore from backup
- `upgrade` - Version upgrades
- `rollback` - Rollback procedures
- `configure` - Configuration changes
- `migrate` - Data/system migration

**Troubleshooting:**
- `troubleshoot` - Problem diagnosis
- `fix` - Bug fixes/repairs
- `debug` - Debugging procedures
- `monitor` - Monitoring setup/usage

**Lifecycle:**
- `install` - Installation procedures
- `setup` - Initial setup/configuration
- `decommission` - System removal
- `maintenance` - Routine maintenance

**Documentation:**
- `decision` - Architecture decisions (ADRs)
- `postmortem` - Incident analysis
- `howto` - How-to guides
- `onboarding` - New hire onboarding
- `security` - Security advisories
- `compliance` - Audit compliance
- `disaster-recovery` - DR plans
- `concept` - Background explanations

---

### Severity (`severity:`)

Operational criticality. Optional but recommended for runbooks.

- `critical` - Production-critical, on-call relevant
- `standard` - Normal operations
- `maintenance` - Scheduled maintenance tasks

---

### Audience (`audience:`)

Who is the primary reader? Optional but helpful.

- `oncall` - On-call engineers
- `developer` - Software developers
- `sre` - SRE/DevOps engineers
- `dba` - Database administrators
- `end-user` - Non-technical users
- `manager` - Technical managers
- `newbie` - New team members

---

### Environment (`env:`)

Which environment? Optional.

- `production` - Production environment
- `staging` - Staging environment
- `development` - Development environment
- `all` - All environments

---

### Status Tags

Auto-set by document lifecycle:

- `active` - Current, maintained
- `draft` - Work in progress
- `deprecated` - No longer recommended
- `archived` - Historical reference only

---

## Tagging Rules

### 1. Use Existing Tags First

Before creating a new tag, check if an existing tag fits. Prefer broader tags over creating narrow ones.

**Good:** `postgresql` (existing)
**Bad:** `postgres-14` (too specific, version in content)

### 2. Lowercase, Hyphenated

All tags are lowercase with hyphens for multi-word.

**Good:** `aws-rds`, `order-service`, `load-balancer`
**Bad:** `AWS_RDS`, `OrderService`, `load balancer`

### 3. Minimum 3 Tags

Every document needs at least 3 tags:
- 1+ system tag
- 1+ action tag
- Additional relevant tags

### 4. Maximum 10 Tags

Don't over-tag. If you need 10+ tags, the document might be too broad.

### 5. Specific Over General

Use the most specific applicable tag.

**Good:** `aws-rds` for RDS-specific doc
**Bad:** `aws` for RDS-specific doc (too general)

---

## Examples

### Runbook Example
```yaml
tags: [postgresql, aws-rds, backup, restore, production, critical, oncall]
```

### Incident Example
```yaml
tags: [postgresql, aws-rds, outage, failover, postmortem]
```

### ADR Example
```yaml
tags: [postgresql, mongodb, decision, database, architecture]
```

### KB Article Example
```yaml
tags: [vpn, windows, troubleshoot, end-user, remote-work]
```

---

## Adding New Tags

If you need a tag that doesn't exist:

1. Check this document thoroughly first
2. Propose in `#documentation` Slack channel
3. Get approval from documentation owner
4. Add to this taxonomy with PR
5. Update any affected documents

**Do not** create ad-hoc tags without adding them here.

---

## Tag Inventory Script

To see all tags currently in use:

```bash
# List all unique tags across documents
grep -rh "^tags:" --include="*.md" | sed 's/tags: \[/\n/g' | tr ',' '\n' | tr -d '[]' | sort -u
```

To find documents with a specific tag:

```bash
# Find all docs tagged with 'postgresql'
grep -rl "tags:.*postgresql" --include="*.md"
```

---

## Changelog

| Date | Change | Author |
|------|--------|--------|
| 2026-01-30 | Initial taxonomy created | @claude |

---

**Next review:** When new systems are added to infrastructure
