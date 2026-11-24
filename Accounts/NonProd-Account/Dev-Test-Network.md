# Dev / Test Network

- VPC CIDR 10.30.128.0/17, associated with TGW-RT-NONPROD.
- Internet egress via the Inspection VPC firewall with a broader (but still logged) allowlist than Production.
- Cost controls: budgets, instance scheduling, and sandbox auto-cleanup.
