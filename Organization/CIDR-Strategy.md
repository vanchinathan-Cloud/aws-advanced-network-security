# CIDR Strategy

## Overview

This document defines the IPv4 addressing strategy for the enterprise AWS landing zone.

The goals are:

- Ensure non-overlapping address space across all AWS accounts.
- Support Transit Gateway and Cloud WAN connectivity.
- Simplify route summarization.
- Enable future account growth without readdressing.
- Integrate with on-premises networks.
- Manage allocations centrally through AWS IP Address Manager (IPAM).

---

## Design Principles

### Non-Overlapping Address Space

Every AWS account receives a unique CIDR allocation.

Benefits:

- Transit Gateway compatibility
- Cloud WAN compatibility
- Simplified routing
- Easier troubleshooting
- Future multi-region expansion

### Hierarchical Allocation

Address ranges are allocated by function rather than workload.

This enables route summarization and future account expansion.

### Centralized Management

The Network Account owns:

- AWS IPAM
- CIDR allocation requests
- CIDR governance
- Overlap validation

CIDRs are shared and tracked centrally across the organization.

---

## AWS Address Plan

| Account | CIDR Block | Purpose |
|----------|----------|----------|
| Network Account | 10.0.0.0/16 | Transit Gateway, Direct Connect, Network Services |
| Security Account | 10.1.0.0/16 | Inspection VPC, AWS Network Firewall, Security Tooling |
| Shared Services Account | 10.2.0.0/16 | DNS, Active Directory, Interface Endpoints |
| Log Archive Account | 10.5.0.0/16 | Logging and Compliance Services |
| Production Account | 10.10.0.0/16 | Production Workloads |
| UAT Account | 10.30.0.0/17 | User Acceptance Testing |
| Non-Production Account | 10.30.128.0/17 | Development and Sandbox Workloads |
| Disaster Recovery Account | 10.40.0.0/16 | Disaster Recovery Environment |

---

## Logical Address Allocation

```text
10.0.0.0/8
│
├── 10.0.0.0/16      Network
├── 10.1.0.0/16      Security
├── 10.2.0.0/16      Shared Services
├── 10.5.0.0/16      Log Archive
│
├── 10.10.0.0/16     Production
│
├── 10.20.0.0/16     Reserved
│
├── 10.30.0.0/16     Non-Production Block
│     ├── 10.30.0.0/17
│     │      └── UAT
│     └── 10.30.128.0/17
│            └── NonProd
│
├── 10.40.0.0/16     Disaster Recovery
│
├── 10.50.0.0/16     Reserved
├── 10.60.0.0/16     Reserved
└── Future Expansion
```

---

## Reserved Address Space

The following ranges are intentionally reserved for future growth:

| CIDR | Purpose |
|--------|----------|
| 10.20.0.0/16 | Additional Production Environment |
| 10.50.0.0/16 | Future Security Expansion |
| 10.60.0.0/16 | Additional Shared Platform Services |
| 10.70.0.0/16 | Future Regional Expansion |
| 10.80.0.0/16 | Acquired Business Units |
| 10.90.0.0/16 | Future Cloud Environments |

No workloads should be deployed into reserved ranges without architecture approval.

---

## VPC Allocation Rules

### Standard VPC Size

Default workload VPC:

```text
/16
```

Examples:

```text
Production
10.10.0.0/16

Disaster Recovery
10.40.0.0/16
```

### Medium Environments

```text
/17
```

Examples:

```text
UAT
10.30.0.0/17

NonProd
10.30.128.0/17
```

### Future Workloads

Future accounts should receive allocations from reserved ranges managed through IPAM.

---

## Subnet Allocation Standards

Example Production VPC:

```text
10.10.0.0/16

Public-AZ1      10.10.0.0/24
Public-AZ2      10.10.1.0/24

PrivateApp-AZ1  10.10.10.0/24
PrivateApp-AZ2  10.10.11.0/24

PrivateDB-AZ1   10.10.20.0/24
PrivateDB-AZ2   10.10.21.0/24

TGW-AZ1         10.10.255.0/28
TGW-AZ2         10.10.255.16/28
```

Dedicated TGW attachment subnets must be used in every VPC.

---

## Hybrid Connectivity Rules

On-premises networks must not overlap with AWS address space.

Current hybrid routes:

```text
On-Prem Corporate Network
172.16.0.0/12

On-Prem VPN Network
192.168.0.0/24
```

Before provisioning a new VPC:

1. Validate CIDR availability in AWS IPAM.
2. Confirm no overlap with existing AWS accounts.
3. Confirm no overlap with on-premises networks.
4. Validate compatibility with Transit Gateway routing.
5. Update IPAM inventory.

---

## Route Summarization Strategy

The address plan supports summarization.

Examples:

```text
10.30.0.0/16
    ├── UAT
    └── NonProd
```

This reduces route-table complexity and improves scalability as additional accounts are onboarded.

---

## Design Benefits

- Supports enterprise-scale multi-account environments.
- Compatible with Transit Gateway and Cloud WAN architectures.
- Prevents overlapping CIDRs.
- Simplifies route summarization.
- Integrates with AWS IPAM.
- Enables future growth without readdressing.
- Supports hybrid connectivity with Direct Connect and VPN.
- Aligns with enterprise networking best practices.
