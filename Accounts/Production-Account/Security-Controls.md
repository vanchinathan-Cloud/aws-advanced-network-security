# Security Controls

- Egress and east-west inspection through the Inspection VPC
- SCP guardrails from the Prod OU ([SCP-Strategy](../../Organization/SCP-Strategy.md))
- IAM least privilege with permission boundaries
- VPC flow logs, CloudTrail, and Config delivered to the Log Archive account
- Security groups reference groups, not wide CIDRs; no 0.0.0.0/0 ingress
