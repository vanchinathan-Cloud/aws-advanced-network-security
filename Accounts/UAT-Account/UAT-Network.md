# UAT Network

- VPC CIDR 10.30.0.0/17, associated with TGW-RT-UAT.
- Reaches Shared Services and permitted on-premises ranges, inspected centrally.
- Routes to Production and NonProd are absent from the route table.
- Internet egress only via the Inspection VPC.
