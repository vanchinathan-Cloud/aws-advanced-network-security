# Terraform

## Overview

This directory contains Infrastructure as Code (IaC) used to deploy networking components for the Enterprise AWS Network Security Platform.

Terraform is used to automate deployment of shared networking infrastructure, enforce consistency across environments, and reduce manual configuration.

Current implementation focuses on Transit Gateway automation, with additional modules planned for security, DNS, logging, and IP management.

---

## Directory Structure

```text
Terraform/

├── modules/
│
│   └── transit-gateway/
│        ├── main.tf
│        ├── variables.tf
│        ├── outputs.tf
│        └── README.md
│
└── live/
    └── network-account/
         ├── main.tf
         ├── terraform.tfvars.example
         ├── providers.tf
         └── outputs.tf
```

---

## Current Module

### Transit Gateway Module

The Transit Gateway module provisions:

- AWS Transit Gateway
- Transit Gateway Route Tables
- Transit Gateway Attachments
- Route Table Associations
- Route Table Propagations
- AWS RAM Share
- Attachment Auto-Accept Controls

Design objectives:

- One Transit Gateway per Region
- Route-table-based environment isolation
- Centralized network governance
- Reusable deployment model

---

## Supported Route Tables

The module creates route tables aligned to the architecture documentation.

```text
TGW-RT-PROD

TGW-RT-UAT

TGW-RT-NONPROD

TGW-RT-SHARED

TGW-RT-SECURITY

TGW-RT-ONPREM

TGW-RT-DR
```

---

## Architecture Alignment

The Terraform configuration implements the same routing strategy defined throughout the repository:

- Production isolation
- UAT isolation
- NonProd isolation
- Shared Services connectivity
- Centralized inspection
- DR connectivity
- Hybrid routing

Default Transit Gateway route propagation and association are disabled to ensure all routing is explicitly controlled.

---

## Usage

```bash
cd Terraform/live/network-account

cp terraform.tfvars.example terraform.tfvars

terraform init

terraform validate

terraform plan
```

Review the execution plan before applying any changes.

---

## Routing Model

### Environment Isolation

Production, UAT, and Non-Production environments are intentionally separated.

```text
Production

✕ UAT

✕ NonProd
```

Transit Gateway route tables control allowed communication paths.

### Centralized Inspection

Internet-bound and inspected traffic is routed through the Security Account inspection VPC.

```text
Spoke VPC

↓

Transit Gateway

↓

Inspection VPC

↓

AWS Network Firewall
```

---

## Future Modules

Planned modules include:

### Security

```text
Network Firewall

Gateway Load Balancer

Security Hub

GuardDuty
```

### DNS

```text
Route53 Resolver

Private Hosted Zones

Resolver Rules
```

### Logging

```text
CloudTrail

Config

Flow Logs

Log Archive
```

### Address Management

```text
AWS IPAM

CIDR Pools

Allocation Workflows
```

### Hybrid Connectivity

```text
Direct Connect Gateway

VPN Connections

Cloud WAN
```

---

## Design Principles

- Infrastructure as Code first
- Modular architecture
- Reusable networking components
- Explicit routing controls
- Consistent deployments
- Version-controlled infrastructure
- CI/CD driven changes

---

## Status

Current Status:

✅ Transit Gateway Module

✅ Route Table Automation

✅ RAM Sharing

✅ Route Propagation Controls

🚧 Network Firewall Module

🚧 AWS IPAM Module

🚧 Route53 Resolver Module

🚧 Logging Module

🚧 Cloud WAN Module

This module is intended as a reference implementation derived from the enterprise architecture documented throughout the repository.
