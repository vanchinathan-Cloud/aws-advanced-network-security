# Landing Zone Design

## Overview
Multi-account landing zone (AWS Control Tower or equivalent) with a dedicated account per function: networking, security, shared services, each workload environment, DR, and log archive.

## Accounts
| Account | OU |
|---|---|
| Network | Infrastructure |
| Shared Services | Infrastructure |
| Security | Security |
| Log Archive | Security |
| Production | Workloads/Prod |
| UAT | Workloads/NonProd |
| NonProd | Workloads/NonProd |
| DR | Workloads/Prod |

## Principles
- Separation of duties between network, security, and workload teams
- No direct internet path from workload VPCs; egress via the Inspection VPC
- Centralized logging from every account to the Log Archive account
- Network resources shared with AWS RAM rather than duplicated per account
- Everything provisioned through Terraform and a pipeline

## Connectivity Summary
On-premises connects through Direct Connect and Site-to-Site VPN (backup) to the Transit Gateway in the Network account, which fans out to every spoke VPC with isolated route tables.
