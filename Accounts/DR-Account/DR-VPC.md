# DR VPC

- CIDR 10.40.0.0/16 in the secondary region, attached to a regional TGW and connected to the primary region over Cloud WAN.
- Associated with TGW-RT-DR; mirrors the Production subnet tiers at reduced scale until failover.
- Own Inspection path in the DR region.
