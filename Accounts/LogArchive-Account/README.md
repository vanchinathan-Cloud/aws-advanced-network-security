# Log Archive Account

## Overview
Centralized immutable logging account.

## Architecture
```mermaid
flowchart LR
    VPC["VPC Flow Logs"] --> S3["Central S3 Bucket"]
    TGW["TGW Flow Logs"] --> S3
    DNS["DNS Logs"] --> S3
    FW["Firewall Logs"] --> S3
    CT["CloudTrail"] --> S3
    S3 --> ATH["Athena"]
    ATH --> SEC["Security Team"]
```

## Log Sources
CloudTrail · AWS Config · VPC Flow Logs · TGW Flow Logs · Route 53 Query Logs · AWS Network Firewall Logs

## Security
- S3 Object Lock
- KMS encryption
- MFA Delete
- Cross-account read access

See [Centralized-Logging](Centralized-Logging.md).
