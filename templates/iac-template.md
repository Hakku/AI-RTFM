---
type: infrastructure_as_code
kernel: iac
title: [Module/Stack Name]
owner: @username
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
review_cycle: 30_days
status: draft
tags: [infra-tag, iac-tool-tag, env-tag]  # See standards/tag-taxonomy.md
# Required: 1+ infrastructure system (aws, kubernetes, etc.), iac tool (terraform, ansible)
# Recommended: environment (production, staging), cloud provider
---

# [Module/Stack Name]

**Tool:** [Terraform / Ansible / CloudFormation / Pulumi]
**Provider:** [AWS / Azure / GCP / On-premise]
**Version:** [Module version X.X.X]

## Module Overview

[Brief description of what this infrastructure module provisions. Include:
- What resources it creates
- What problem it solves
- Where it fits in the overall architecture]

**Architecture Diagram:**
```
[Simple ASCII diagram of resources created]
┌─────────────┐     ┌─────────────┐
│  [Resource]  │────▶│  [Resource]  │
└─────────────┘     └─────────────┘
```

## Prerequisites

### Required Access

- [ ] [Cloud provider] account with [role/permissions]
- [ ] [State backend] access (e.g., S3 bucket, Terraform Cloud)
- [ ] [Secret management] access (e.g., Vault, AWS Secrets Manager)

### Required Tools

| Tool | Minimum Version | Install |
|------|----------------|---------|
| [Terraform] | [>= 1.X.X] | [Install link] |
| [Provider CLI] | [>= X.X] | [Install link] |
| [Other tool] | [>= X.X] | [Install link] |

### Dependencies

- [ ] [Prerequisite module/stack] must be deployed first
- [ ] [Network/VPC] must exist
- [ ] [DNS/certificates] must be configured

## Variable Reference

### Required Variables

| Variable | Type | Description | Example |
|----------|------|-------------|---------|
| `environment` | string | Deployment environment | `"production"` |
| `region` | string | Cloud region | `"eu-west-1"` |
| `instance_type` | string | Compute instance size | `"t3.medium"` |

### Optional Variables

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `enable_monitoring` | bool | `true` | Enable CloudWatch monitoring |
| `backup_retention_days` | number | `7` | Number of days to retain backups |
| `tags` | map(string) | `{}` | Additional resource tags |

### Example Variable File

```hcl
# terraform.tfvars
environment         = "production"
region              = "eu-west-1"
instance_type       = "t3.medium"
enable_monitoring   = true
backup_retention_days = 30

tags = {
  project    = "order-service"
  cost_center = "engineering"
}
```

## Usage Examples

### Basic Usage

```hcl
module "[module_name]" {
  source = "./modules/[module_name]"

  environment   = "production"
  region        = "eu-west-1"
  instance_type = "t3.medium"
}
```

### Advanced Usage

```hcl
module "[module_name]" {
  source = "./modules/[module_name]"

  environment         = "production"
  region              = "eu-west-1"
  instance_type       = "t3.large"
  enable_monitoring   = true
  backup_retention_days = 30

  tags = {
    project = "order-service"
  }
}
```

### Deployment Commands

```bash
# Initialize
terraform init

# Preview changes
terraform plan -var-file=environments/production.tfvars

# Apply changes
terraform apply -var-file=environments/production.tfvars

# Verify deployment
terraform output
```

**Expected plan output:**
```
Plan: X to add, Y to change, Z to destroy.
```

## Outputs Reference

| Output | Type | Description | Usage |
|--------|------|-------------|-------|
| `resource_id` | string | ID of the primary resource | Used by dependent modules |
| `endpoint` | string | Connection endpoint | Application configuration |
| `security_group_id` | string | Security group ID | Network rules |

### Accessing Outputs

```bash
# Get specific output
terraform output resource_id

# Get all outputs as JSON
terraform output -json
```

## State Considerations

### State Backend

```hcl
# backend.tf
terraform {
  backend "s3" {
    bucket         = "[state-bucket-name]"
    key            = "[module-name]/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

### State Operations

```bash
# List resources in state
terraform state list

# Import existing resource
terraform import [resource_type].[name] [resource_id]

# Remove resource from state (without destroying)
terraform state rm [resource_type].[name]
```

**Warning:** Never manually edit state files. Always use `terraform state` commands.

### State Locking

- Lock backend: [DynamoDB / Consul / Terraform Cloud]
- Lock timeout: [X minutes]
- Force unlock: `terraform force-unlock [LOCK_ID]` (emergency only)

## Maintenance Notes

### Regular Maintenance

| Task | Frequency | Command |
|------|-----------|---------|
| Version updates | Monthly | `terraform init -upgrade` |
| Plan review | Before each apply | `terraform plan` |
| State backup | Weekly (automated) | [Backup mechanism] |
| Cost review | Monthly | [Cost tool/dashboard] |

### Estimated Costs

| Resource | Monthly Cost | Notes |
|----------|-------------|-------|
| [Resource 1] | ~$[XX] | [Cost basis] |
| [Resource 2] | ~$[XX] | [Cost basis] |
| **Total** | **~$[XX]** | Per environment |

### Destroy Procedure

```bash
# Preview destruction
terraform plan -destroy -var-file=environments/[env].tfvars

# Destroy (requires confirmation)
terraform destroy -var-file=environments/[env].tfvars
```

**Before destroying:**
- [ ] Confirm no dependent services are running
- [ ] Back up any persistent data
- [ ] Notify affected teams
- [ ] Get approval from [role/team]

## Migration Path

### Upgrading Module Version

1. Review changelog for breaking changes
2. Update module source version
3. Run `terraform init -upgrade`
4. Run `terraform plan` to review changes
5. Apply in non-production first
6. Verify functionality before promoting to production

### Known Breaking Changes

| Version | Change | Migration Steps |
|---------|--------|-----------------|
| [v2.0] | [Breaking change description] | [Migration steps] |

## Related Documentation

- [Architecture decision](../adr/related-adr.md)
- [Network configuration](../runbooks/network-setup.md)
- [Monitoring setup](../runbooks/monitoring-setup.md)
- [Disaster recovery](../runbooks/dr-procedure.md)

## Maintenance

**Review Schedule:** Every 30 days

**Last Reviewed By:** @username on YYYY-MM-DD

**Changelog:**
- YYYY-MM-DD: Initial creation
- YYYY-MM-DD: Updated [section] for [reason]
