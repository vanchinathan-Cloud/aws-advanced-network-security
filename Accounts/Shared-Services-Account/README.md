# Shared Services Account

## Overview
Provides common enterprise services shared across AWS accounts.

## Services
Active Directory · DNS · Interface Endpoints · Private Hosted Zones · Backup Services

## Architecture
```mermaid
flowchart LR
    PRD["Production"] --> DNS["Route 53 Private Hosted Zones"]
    UAT["UAT"] --> DNS
    DEV["Non-Prod"] --> DNS
    DR["DR"] --> DNS
    PRD --> AD["Managed Microsoft AD"]
    UAT --> AD
    DEV --> AD
    DR --> AD
    PRD --> EP["Interface Endpoints"]
    UAT --> EP
    DEV --> EP
    DR --> EP
```

## Interface Endpoints
SSM · KMS · Secrets Manager · STS · CloudWatch · ECR · SNS · SQS · Lambda

## DNS Architecture
- **Inbound Resolver:** receives DNS requests from on-premises.
- **Outbound Resolver:** forwards DNS requests to on-premises DNS infrastructure.

## Documents
[DNS Architecture](DNS-Architecture.md) · [Active Directory](Active-Directory.md) · [Interface Endpoints](Interface-Endpoints.md) · [PrivateLink](PrivateLink.md) · [Backup Services](Backup-Services.md)
