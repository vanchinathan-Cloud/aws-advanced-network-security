# SCP Strategy

## Guardrails
| SCP | Applied To | Effect |
|---|---|---|
| Deny internet gateway creation | Workload OUs | Prevents direct internet paths; egress is via Inspection VPC |
| Deny disabling CloudTrail / Config / GuardDuty | All OUs | Protects the audit trail |
| Region restriction | All OUs | Only approved primary and DR regions |
| Deny modification of Transit Gateway attachments | Workload OUs | Only the Network account manages routing |
| Deny deleting log buckets / Object Lock changes | Security OU | Preserves immutable logs |
| Deny root user actions | All OUs | Root only used for break-glass |
| Require encryption (KMS) | All OUs | Data at rest encrypted |

## Principles
- SCPs are preventive, IAM least privilege is the grant layer
- Test in a sandbox OU before attaching to Production
- Break-glass role documented in `Docs/`
