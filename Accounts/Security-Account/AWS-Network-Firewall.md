# AWS Network Firewall

- Firewall endpoints in each AZ of the Inspection VPC, managed centrally (optionally via AWS Firewall Manager).
- Stateless rules for fast allow/drop, stateful rules (Suricata-compatible) for deep inspection.
- Domain allowlists for egress; default deny.
- Alert and flow logs sent to CloudWatch, then archived in the Log Archive account.
- Rule changes go through the Terraform pipeline with peer review.
