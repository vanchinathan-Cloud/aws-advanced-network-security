# Terraform

Infrastructure as code for the Network account.

```text
Terraform/
├── modules/
│   └── transit-gateway/     # Transit Gateway, route tables, attachments, RAM share
└── live/
    └── network-account/     # Example that wires the module to this design
```

## What is included
- **`modules/transit-gateway`**: a reusable module that builds the Transit Gateway with one route table per environment and default association/propagation turned off.
- **`live/network-account`**: uses the module with the seven route tables from the design, the Inspection VPC (appliance mode), and the propagation rules from [Routing-Strategy](../Accounts/Network-Account/Routing-Strategy.md).

## How to use
```bash
cd Terraform/live/network-account
cp terraform.tfvars.example terraform.tfvars   # fill in real values
terraform init
terraform plan
```

## How isolation works (plain English)
- Each environment has its own route table and only learns the routes it is allowed to reach.
- Prod, UAT and NonProd have no route to each other.
- Everything else goes to the Inspection VPC, and the firewall rules decide what is allowed.

## Status
The module is written from the design in this repo. Run `terraform validate` and `terraform plan` against a test account before real use. More modules (inspection VPC, Network Firewall, IPAM, log archive) can be added under `modules/`.
