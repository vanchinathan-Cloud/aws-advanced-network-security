# IPAM

- AWS IPAM runs in the Network account and is shared through RAM.
- Top-level pool is split into regional pools and then per-account pools.
- Allocation rules enforce non-overlapping CIDRs. See [CIDR-Strategy](../../Organization/CIDR-Strategy.md).
- IPAM monitors drift and reports unauthorized or overlapping VPC CIDRs.
