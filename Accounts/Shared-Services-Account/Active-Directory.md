# Active Directory

- AWS Managed Microsoft AD deployed across multiple AZs, with a trust to the on-premises AD.
- Domain join for Windows workloads in all environments via shared directory.
- Reachable from spokes through the Transit Gateway (TGW-RT-SHARED).
- Backups and logs follow the central policies.
