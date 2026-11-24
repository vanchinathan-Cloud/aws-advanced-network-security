# Transit Gateway module

Creates one Transit Gateway with separate route tables per environment, so each environment only reaches what you explicitly allow.

## What it does
- Creates the Transit Gateway with default association and propagation **turned off**.
- Creates the route tables you list (Prod, UAT, NonProd, Shared, Security, On-Prem, DR).
- Attaches VPCs in this account (for example the Inspection VPC, with appliance mode).
- Associates attachments from other accounts with the right route table.
- Adds propagations and static routes.
- Shares the Transit Gateway with other accounts through AWS RAM.

## Spoke accounts
Each spoke account creates its own VPC attachment to the shared Transit Gateway. The Network account then associates that attachment with the right route table using `external_attachments`.

## Example
See [`../../live/network-account`](../../live/network-account).
