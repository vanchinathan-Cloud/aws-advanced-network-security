# CIDR Strategy

## Overview

This document defines the IPv4 address allocation strategy for the AWS landing zone.

The design supports:

- AWS Organizations multi-account architecture
- AWS Transit Gateway
- AWS Cloud WAN
- Direct Connect and VPN connectivity
- Centralized inspection
- Disaster Recovery
- Future account growth

All CIDR allocations are centrally managed through AWS IP Address Manager (IPAM) hosted in the Network Account.

---

# Design Principles

## Non-Overlapping Address Space

Every AWS account receives a unique CIDR allocation.

Benefits:

- Transit Gateway compatibility
- Cloud WAN compatibility
- Simplified route propagation
- Easier troubleshooting
- Simplified disaster recovery

CIDR overlap is prohibited.

---

## Centralized IP Management

The Network Account owns:

- AWS IPAM
- CIDR allocation requests
- Address inventory
- Overlap validation
- Route summarization standards

New CIDRs must be allocated through IPAM before deployment.

---

## Growth-Oriented Addressing

Addresses are allocated with future expansion in mind.

Reserved ranges exist for:

- Additional Production accounts
- Additional Shared Services accounts
- Acquisitions and mergers
- Additional Regions
- Future cloud platforms

No workload may use reserved space without architecture approval.

---

# AWS Address Plan

| Account | CIDR Block | Purpose |
|----------|----------|----------|
| Production Account | 10.10.0.0/16 | Production Workloads |
| Shared Services Account | 10.20.0.0/17 | DNS, Active Directory, Private Hosted Zones, Interface Endpoints |
| UAT Account | 10.30.0.0/17 | User Acceptance Testing |
| Non-Production Account | 10.30.128.0/17 | Development, Sandbox, Training |
| Disaster Recovery Account | 10.40.0.0/16 | Secondary Region Recovery Environment |
| Security Account | 10.50.0.0/17 | Inspection VPC, AWS Network Firewall, Security Services |
| Network Account | 10.60.0.0/17 | Transit Gateway, Direct Connect, VPN, Cloud WAN, IPAM |
| Log Archive Account | No VPC Required | Centralized Logging and Compliance Services |

---

# Enterprise Address Hierarchy

```text
10.0.0.0/8

├── 10.10.0.0/16
│     └── Production
│
├── 10.20.0.0/17
│     └── Shared Services
│
├── 10.30.0.0/16
│     ├── 10.30.0.0/17
│     │    └── UAT
│     │
│     └── 10.30.128.0/17
│          └── NonProd
│
├── 10.40.0.0/16
│     └── Disaster Recovery
│
├── 10.50.0.0/17
│     └── Security
│
├── 10.60.0.0/17
│     └── Network Services
│
├── 10.70.0.0/16
│     └── Reserved
│
├── 10.80.0.0/16
│     └── Reserved
│
└── 10.90.0.0/16
      └── Reserved
```

---

# Reserved Address Space

The following ranges are intentionally reserved for future growth.

| CIDR Block | Reserved For |
|------------|-------------|
| 10.70.0.0/16 | Additional Shared Services |
| 10.80.0.0/16 | Future Business Units |
| 10.90.0.0/16 | Acquisitions and Migrations |

Reserved address space must not be assigned without architecture review.

---

# VPC Allocation Standards

## Production

```text
CIDR:
10.10.0.0/16
```

Supports:

- Application tiers
- Database tiers
- Analytics workloads
- Future subnet growth

---

## Shared Services

```text
CIDR:
10.20.0.0/17
```

Hosts:

- Route 53 Resolver
- Active Directory
- DNS Services
- Shared Interface Endpoints

---

## UAT

```text
CIDR:
10.30.0.0/17
```

Hosts:

- User Acceptance Testing
- Integration Testing
- Performance Testing

---

## Non-Production

```text
CIDR:
10.30.128.0/17
```

Hosts:

- Development
- Sandbox
- Automation Testing

---

## Disaster Recovery

```text
CIDR:
10.40.0.0/16
```

Supports:

- Pilot Light
- Warm Standby
- Active-Passive DR

---

## Security

```text
CIDR:
10.50.0.0/17
```

Hosts:

- AWS Network Firewall
- Gateway Load Balancer
- Security Tooling
- Inspection Services

---

## Network

```text
CIDR:
10.60.0.0/17
```

Hosts:

- Transit Gateway Services
- Direct Connect Integration
- VPN Services
- Route 53 Resolver Infrastructure
- AWS IPAM

---

# Subnet Allocation Standards

Example Production VPC:

```text
10.10.0.0/16

Public-AZ1           10.10.0.0/24
Public-AZ2           10.10.1.0/24

PrivateApp-AZ1       10.10.10.0/24
PrivateApp-AZ2       10.10.11.0/24

PrivateDB-AZ1        10.10.20.0/24
PrivateDB-AZ2        10.10.21.0/24

TGW-Attachment-AZ1   10.10.255.0/28
TGW-Attachment-AZ2   10.10.255.16/28
```

Each VPC must reserve dedicated TGW attachment subnets.

---

# Hybrid Connectivity Rules

Before allocating any CIDR:

1. Validate availability within AWS IPAM.
2. Confirm no overlap with existing AWS accounts.
3. Confirm no overlap with on-premises networks.
4. Confirm compatibility with Transit Gateway routing.
5. Update the central IPAM inventory.

Example on-premises ranges:

```text
Corporate Network
172.16.0.0/12

VPN Network
192.168.0.0/24
```

These examples must be replaced with actual enterprise allocations during implementation.

---

# Route Summarization Strategy

Address allocations are aligned to simplify route aggregation.

Example:

```text
10.30.0.0/16

├── 10.30.0.0/17
│     └── UAT

└── 10.30.128.0/17
      └── NonProd
```

This allows route summarization while maintaining environment isolation.

---

# Multi-Region Expansion

Future secondary regions should use dedicated, non-overlapping CIDR blocks.

Example:

```text
Primary Region

Production
10.10.0.0/16

Disaster Recovery
10.40.0.0/16
```

Future growth may allocate additional reserved ranges for regional expansion.

---

# Design Benefits

- Supports enterprise-scale multi-account environments.
- Fully compatible with AWS Transit Gateway.
- Supports AWS Cloud WAN integration.
- Prevents IP overlap across accounts.
- Simplifies route management.
- Supports hybrid networking through Direct Connect and VPN.
- Enables scalable future growth.
- Managed centrally through AWS IPAM.
- Aligns with enterprise networking best practices.
