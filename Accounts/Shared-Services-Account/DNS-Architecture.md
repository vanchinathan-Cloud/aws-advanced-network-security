# DNS Architecture

- Route 53 private hosted zones are associated with spoke VPCs (cross-account association).
- **Inbound resolver endpoints** accept queries from on-premises for AWS-hosted zones.
- **Outbound resolver endpoints** with forwarding rules send corporate-domain queries to on-premises DNS.
- Resolver rules are shared through RAM.
- Resolver query logs go to the Log Archive account.
