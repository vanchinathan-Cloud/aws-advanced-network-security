# Cloud WAN

- Connects the primary-region network to the DR region (the DR account's VPC attaches via Cloud WAN).
- Core network policy defines segments aligned to environments (prod, nonprod, shared, dr).
- Managed through AWS Network Manager for global visibility.
- Segment sharing is limited to the minimum needed, e.g. Production to DR for replication traffic.
