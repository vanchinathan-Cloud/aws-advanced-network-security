# Production VPC

- CIDR: 10.10.0.0/16, across at least three AZs.
- Subnet tiers: public (ALB only), application, database, and TGW attachment.
- No Internet Gateway (blocked by SCP); public-facing traffic enters through ALB/CloudFront with WAF.
- Databases are Multi-AZ, encrypted with KMS, and replicate to DR.
