---
type: architecture_decision_record
kernel: adr
adr_number: 0001
title: Use PostgreSQL as Primary Database
owner: @mwilson
created: 2026-03-01
last_updated: 2026-03-02
date: 2026-03-01
status: accepted
supersedes: null
superseded_by: null
tags: [postgresql, mongodb, decision, architecture]
---

# ADR-0001: Use PostgreSQL as Primary Database

**Status:** Accepted  
**Date:** 2026-03-01
**Owner:** @mwilson  
**Reviewers:** @jsmith, @pgupta, @engineering-manager

## Context

We are building a new order management system that will handle customer orders, inventory, and payments. We need to choose a primary database that will serve as the source of truth for all transactional data.

**Background:**
- Currently using MongoDB for user-service (document-oriented data)
- Need strong ACID guarantees for financial transactions
- Team has mixed experience: 3 engineers know PostgreSQL well, 2 know MongoDB
- Expected scale: 10,000 orders/day initially, growing to 100,000 orders/day in 2 years
- Data model: Relational (orders, line items, customers, inventory)

**Why is this decision needed now?**
We're starting development of order-service next week. The database choice will affect our data model design, ORM selection, and infrastructure setup. Making this decision upfront avoids costly rewrites later.

## Decision Drivers

Key factors influencing this decision:

* **ACID Compliance:** Financial transactions require strong consistency guarantees
* **Team Expertise:** Most team members have PostgreSQL experience
* **Ecosystem & Tooling:** Need mature backup, replication, and monitoring tools
* **Query Flexibility:** Complex joins and aggregations needed for reporting
* **Cost:** Both infrastructure and operational costs
* **Performance:** Sub-100ms query latency required
* **Scalability:** Must handle 100,000 orders/day within 2 years
* **Data Modeling:** Relational data with foreign keys and constraints

## Options Considered

### Option 1: PostgreSQL

**Description:**
Open-source relational database with ACID compliance, mature ecosystem, and excellent PostgreSQL extensions (PostGIS, full-text search, JSON support).

**Pros:**
- ✅ Full ACID compliance (essential for financial transactions)
- ✅ Strong consistency model (no eventual consistency issues)
- ✅ Team expertise (3/5 engineers proficient)
- ✅ Excellent tooling (pgAdmin, pg_dump, Patroni for HA)
- ✅ Complex query support (joins, subqueries, CTEs)
- ✅ Data integrity (foreign keys, constraints, triggers)
- ✅ JSON support (for flexible fields while maintaining relations)
- ✅ Mature replication (streaming, logical replication)
- ✅ AWS RDS support (managed service available)
- ✅ Active community and long-term support

**Cons:**
- ❌ Vertical scaling limits (single-node writes)
- ❌ Harder to scale horizontally than NoSQL (though solutions exist: Citus)
- ❌ Slower for massive write-heavy workloads (compared to NoSQL)
- ❌ Schema migrations require care in production

**Estimated Cost:** 
- Development: $500/month (RDS db.t3.medium for dev/staging)
- Production: $2,000/month (RDS db.r5.2xlarge with Multi-AZ)
- Total year 1: ~$30,000

**Implementation Effort:** Low - Team is familiar, plenty of documentation

---

### Option 2: MongoDB

**Description:**
Document-oriented NoSQL database with flexible schema, horizontal scalability, and good performance for read-heavy workloads.

**Pros:**
- ✅ Flexible schema (easy to evolve data model)
- ✅ Horizontal scalability (sharding built-in)
- ✅ Good performance for read-heavy workloads
- ✅ JSON-native (natural fit for modern APIs)
- ✅ Some team expertise (2/5 engineers know it)
- ✅ Atlas (managed cloud service)

**Cons:**
- ❌ ACID transactions limited (multi-document transactions added in 4.0, but with limitations)
- ❌ No foreign key constraints (integrity enforced at application level)
- ❌ Complex joins inefficient (requires application-level denormalization)
- ❌ Less mature tooling for backups and monitoring
- ❌ Team less experienced (only 2/5 engineers proficient)
- ❌ Eventual consistency by default (can be configured, but adds complexity)
- ❌ Risk of data inconsistency (without proper application-level checks)

**Estimated Cost:**
- Development: $400/month (Atlas M10 cluster)
- Production: $3,000/month (Atlas M30 cluster with replication)
- Total year 1: ~$40,000

**Implementation Effort:** Medium - Requires learning for 3 team members

---

### Option 3: CockroachDB

**Description:**
Distributed SQL database that provides PostgreSQL compatibility with horizontal scalability and global distribution.

**Pros:**
- ✅ PostgreSQL-compatible (easy migration path)
- ✅ Horizontal scalability (built-in distributed architecture)
- ✅ ACID transactions (distributed ACID)
- ✅ High availability (automatic failover, no single point of failure)
- ✅ Global distribution (multi-region support)

**Cons:**
- ❌ Less mature than PostgreSQL (fewer years in production)
- ❌ Higher complexity (distributed systems are harder to debug)
- ❌ Higher cost (requires 3+ nodes minimum)
- ❌ Performance overhead (distributed consensus)
- ❌ No team experience (steep learning curve)
- ❌ Limited tooling ecosystem (compared to PostgreSQL)

**Estimated Cost:**
- Development: $1,000/month (3-node cluster minimum)
- Production: $5,000/month (3-node cluster with larger instances)
- Total year 1: ~$72,000

**Implementation Effort:** High - New technology for entire team

---

## Decision

**We have decided to: Use PostgreSQL as our primary database.**

**Rationale:**

After careful evaluation, PostgreSQL is the best choice for our order management system for the following reasons:

1. **ACID Compliance is Non-Negotiable:**
   Financial transactions require strong consistency. PostgreSQL provides true ACID guarantees without caveats. MongoDB's transaction support is newer and has limitations. The risk of data inconsistency in a financial system is unacceptable.

2. **Team Expertise Reduces Risk:**
   3 out of 5 engineers are proficient with PostgreSQL. This means faster development, fewer bugs, and better operational practices. The learning curve for MongoDB or CockroachDB would delay the project and introduce risk.

3. **Relational Data Model is a Good Fit:**
   Our domain model (orders, line items, customers, inventory) is inherently relational with many foreign key relationships. PostgreSQL's relational model with constraints and joins is a natural fit. MongoDB would require application-level enforcement of relationships.

4. **Mature Ecosystem and Tooling:**
   PostgreSQL has decades of production use, excellent tooling (pg_dump, pg_basebackup, Patroni, pgAdmin), and AWS RDS managed service. This reduces operational burden and risk.

5. **Cost-Effective:**
   PostgreSQL on AWS RDS is $30,000/year vs. MongoDB Atlas at $40,000/year and CockroachDB at $72,000/year. For our current scale, the price/performance ratio favors PostgreSQL.

6. **Performance Meets Requirements:**
   PostgreSQL easily handles 10,000-100,000 orders/day with proper indexing and query optimization. While horizontal scaling is harder than with NoSQL, we can use read replicas and connection pooling to scale reads. Vertical scaling handles writes for our projected volume.

**Tradeoffs Accepted:**

- **Horizontal Write Scalability:** PostgreSQL scales vertically (bigger instance) rather than horizontally (more nodes). For our projected 100,000 orders/day, this is acceptable. If we need more, solutions like Citus (PostgreSQL extension for sharding) or switching to CockroachDB are migration paths.

- **Schema Migrations:** Changing schema in production requires careful planning (e.g., using `ALTER TABLE` with minimal locking). However, our relational model is relatively stable, so frequent schema changes aren't expected.

**Assumptions:**
- Order volume stays under 100,000/day for next 2 years
- Multi-region deployment not needed initially
- Vertical scaling sufficient for writes

If these assumptions prove wrong, we can revisit this decision (see Consequences).

## Consequences

### Positive

**Faster Development:**
Team can start building immediately with familiar technology. No learning curve delays.

**Reliable Transactions:**
Strong ACID guarantees mean we can trust data consistency. No need for complex application-level transaction management.

**Better Data Integrity:**
Foreign keys, constraints, and triggers enforce business rules at the database level, reducing bugs.

**Rich Query Capabilities:**
Complex reports and analytics are easier with SQL joins, CTEs, and window functions.

**Operational Maturity:**
Proven backup, replication, and monitoring tools reduce operational risk.

### Negative

**Vertical Scaling Limitations:**
If we exceed 100,000 orders/day, we'll need to explore sharding or migrate to a distributed database. This is a known risk but acceptable given our growth projections.

**Schema Migration Overhead:**
Database schema changes require careful planning and testing. We'll need a robust migration strategy (e.g., using Flyway or Liquibase).

**Single Point of Write Failure:**
PostgreSQL primary is a single write node. Mitigated by AWS RDS Multi-AZ (automatic failover to standby), but manual failover may be needed in some scenarios.

### Neutral

**JSON Support:**
PostgreSQL's JSON columns allow some flexibility while maintaining relational integrity. This is a middle ground between rigid schemas and schema-less NoSQL.

**Future Migration Path:**
If we outgrow PostgreSQL, CockroachDB is PostgreSQL-compatible, making migration easier than switching from MongoDB.

## Implementation

### Migration Plan

**Phase 1: Development Environment (Week 1)**
- Provision RDS PostgreSQL 14 in development AWS account
- Set up schema with initial tables (orders, line_items, customers, inventory)
- Configure connection pooling (PgBouncer)
- Set up automated backups (daily snapshots, 7-day retention)

**Phase 2: Staging Environment (Week 2)**
- Provision RDS PostgreSQL 14 in staging AWS account (smaller instance: db.t3.large)
- Mirror production configuration
- Load test with 50,000 orders/day

**Phase 3: Production Environment (Week 4)**
- Provision RDS PostgreSQL 14 in production (db.r5.2xlarge, Multi-AZ enabled)
- Set up monitoring (CloudWatch, Datadog)
- Configure backups (daily snapshots + continuous WAL archiving to S3)
- Enable encryption at rest and in transit

**Phase 4: Application Integration (Ongoing)**
- Use SQLAlchemy ORM (Python) for order-service
- Implement connection pooling at application level
- Write database migration scripts using Alembic

### Rollback Strategy

**If PostgreSQL proves inadequate:**

1. **Short-term:** Vertical scaling (upgrade to larger RDS instance)
2. **Medium-term:** Add read replicas for read scaling
3. **Long-term:** Evaluate CockroachDB (PostgreSQL-compatible) or Citus (sharding extension)

**Trigger for reevaluation:**
- Query latency consistently >100ms
- Write throughput exceeds 10,000 transactions/second
- Database CPU consistently >80%
- Business requires multi-region active-active setup

**Risk Level:** Low (clear upgrade paths exist)

### Success Criteria

We'll consider this decision successful if:

- [ ] Order service handles 10,000 orders/day with <100ms P95 latency (by end of month 1)
- [ ] Zero data inconsistencies or transaction rollback failures (ongoing)
- [ ] Database CPU utilization <70% during peak hours (ongoing)
- [ ] Team velocity maintained (no delays due to database choice) (by end of month 2)
- [ ] Backup and restore tested successfully (monthly drills)
- [ ] Scales to 50,000 orders/day without major changes (by end of year 1)

**Review Date:** 2026-09-01 (6 months after production launch)

## Compliance & Security

**Security Considerations:**
- Encryption at rest enabled (AWS RDS default encryption)
- Encryption in transit enforced (require SSL connections)
- IAM database authentication for admin access
- Secrets stored in AWS Secrets Manager (not environment variables)
- Network isolation (database in private subnet, no public access)

**Compliance Requirements:**
- ✅ PCI DSS: PostgreSQL supports required encryption and audit logging
- ✅ GDPR: Can implement data retention policies and right-to-deletion
- ✅ SOC 2: AWS RDS provides SOC 2 compliance, we handle application-level controls

## Documentation & Training

**Documentation Needed:**
- [x] Database schema documentation (auto-generated from migrations)
- [x] Connection pooling configuration guide
- [x] Backup and restore runbook
- [ ] Performance tuning guide (due: 2026-04-01)
- [ ] Migration script best practices (due: 2026-04-01)

**Training Required:**
- [ ] Database operations workshop for SRE team (scheduled: 2026-03-15)
- [ ] PostgreSQL best practices session for developers (scheduled: 2026-03-20)
- [ ] Query optimization training (scheduled: 2026-04-01)

## Related Decisions

- ADR-0002: Use Alembic for Database Migrations (pending)
- ADR-0003: Use PgBouncer for Connection Pooling (pending)

## References

- [PostgreSQL 14 Release Notes](https://www.postgresql.org/docs/14/release-14.html)
- [AWS RDS for PostgreSQL](https://aws.amazon.com/rds/postgresql/)
- [MongoDB vs PostgreSQL Comparison](https://www.mongodb.com/compare/mongodb-postgresql)
- [CockroachDB Documentation](https://www.cockroachlabs.com/docs/)
- Internal: [Database Evaluation Spreadsheet](https://docs.google.com/spreadsheets/d/xyz)
- Internal: [Load Test Results](https://confluence.company.com/postgres-loadtest)

## Discussion

**Key Discussion Points:**

**@jsmith:** "What about horizontal scaling if we grow faster than expected?"
- **Resolution:** We'll use read replicas for read scaling. If write scaling becomes an issue, CockroachDB is a PostgreSQL-compatible migration path.

**@pgupta:** "MongoDB has better developer experience with flexible schemas."
- **Resolution:** While true, our data model is relational and relatively stable. The benefits of ACID and data integrity outweigh schema flexibility for financial data.

**@engineering-manager:** "What's the long-term lock-in risk?"
- **Resolution:** PostgreSQL is open-source with multiple compatible databases (CockroachDB, YugabyteDB). Migration is easier than from MongoDB.

**Open Questions:**
- [x] Should we use PostGIS extension for future location-based features? **Decision:** Yes, enable in initial setup even if unused now.
- [x] Connection pool sizing (PgBouncer vs. PgPool)? **Decision:** PgBouncer (simpler, lower overhead).

## Approval

**Architecture Review Board:**
- [x] @mwilson (Database Lead) - Approved on 2026-03-01
- [x] @jsmith (Tech Lead) - Approved on 2026-03-01
- [x] @pgupta (SRE Lead) - Approved on 2026-03-02

**Stakeholder Sign-off:**
- [x] @engineering-manager - Approved on 2026-03-02
- [x] @product-manager - Informed on 2026-03-02 (no objections)

---

**Notes:**
- This ADR is now immutable as it has been accepted
- Any changes to database strategy require a new superseding ADR
- Status will be updated to "superseded" if we migrate away from PostgreSQL

**Changelog:**
- 2026-03-01: Created (status: proposed)
- 2026-03-02: Updated after ARB review, minor clarifications
- 2026-03-02: Accepted by ARB (status: accepted)

