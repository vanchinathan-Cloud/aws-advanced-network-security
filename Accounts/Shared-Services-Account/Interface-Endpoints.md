# Interface Endpoints

Centralized in the Shared Services VPC to avoid per-VPC endpoint cost.

| Service | Purpose |
|---|---|
| SSM | Systems Manager access |
| KMS | Encryption |
| Secrets Manager | Secrets |
| STS | Role assumption |
| CloudWatch | Logs and metrics |
| ECR | Container images |
| SNS / SQS | Messaging |
| Lambda | Function invocation |

Private DNS is disabled on the shared endpoints. Route 53 private hosted zones for each service name are associated with spoke VPCs so names resolve to the shared endpoint IPs.
