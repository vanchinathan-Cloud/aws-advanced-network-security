# CIDR Strategy

## Allocation
| Account | CIDR | Source |
|---|---|---|
| Network | 10.0.0.0/16 | Proposed |
| Security (Inspection) | 10.1.0.0/16 | Proposed |
| Shared Services | 10.2.0.0/16 | Proposed |
| Log Archive | 10.5.0.0/16 | Proposed |
| Production | 10.10.0.0/16 | Source design |
| UAT | 10.30.0.0/17 | Source design |
| NonProd | 10.30.128.0/17 | Source design |
| DR | 10.40.0.0/16 | Source design |

## Rules
- Ranges are non-overlapping, so everything can attach to one Transit Gateway and Cloud WAN.
- Managed centrally with AWS IPAM in the Network account and shared via RAM.
- UAT and NonProd split a single /16 (10.30.0.0/16) into two /17s.
- 10.10.0.0/16 through 10.40.0.0/16 leave gaps (10.20.x) for future environments.
- Confirm there is no overlap with on-premises ranges before deployment.
