# Failover Design

1. Detect: health checks and monitoring declare the primary impaired.
2. Decide: incident commander authorizes failover per runbook.
3. Promote: database replicas promoted, compute scaled up (pilot light / warm standby).
4. Redirect: Route 53 failover records shift traffic to the DR region.
5. Validate: application validation checks run in the DR environment.
6. Fail back: reverse replication and planned cutback.

Define RTO / RPO per application tier and test at least twice a year.
