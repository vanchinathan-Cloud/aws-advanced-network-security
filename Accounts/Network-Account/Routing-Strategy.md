# Routing Strategy

## Principles
- Environment isolation through separate TGW route tables, with no default propagation.
- Production, UAT, and NonProd cannot route to each other.
- All spoke default routes (0.0.0.0/0) point to the Inspection VPC attachment.
- Hybrid routes are advertised to on-premises via BGP, summarized where possible.

## Reachability Matrix
| Source / Destination | Prod | UAT | NonProd | Shared | DR | On-Prem |
|---|---|---|---|---|---|---|
| Prod | - | Deny | Deny | Allow | Allow | Allow |
| UAT | Deny | - | Deny | Allow | Deny | Allow* |
| NonProd | Deny | Deny | - | Allow | Deny | Allow* |
| Shared | Allow | Allow | Allow | - | Allow | Allow |
| DR | Allow | Deny | Deny | Allow | - | Allow |

\* Allowed for the non-prod on-premises ranges only. This matrix extends the source design and should be reviewed. All allowed flows traverse the Inspection VPC.
