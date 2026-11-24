# Inspection VPC

- Attached to the TGW with **appliance mode enabled**.
- Three subnet tiers per AZ: TGW attachment, firewall endpoint, and (optional) NAT / egress.
- Handles east-west inspection between allowed environments, on-premises ingress/egress, and internet egress for all workloads.
- Internet egress through NAT gateways with a controlled, allowlisted set of destinations.
- CIDR: 10.1.0.0/16 (proposed).
