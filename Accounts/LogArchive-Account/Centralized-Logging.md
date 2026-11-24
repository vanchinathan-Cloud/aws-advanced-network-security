# Centralized Logging

- One bucket per log type and region, with Object Lock (compliance mode) and a retention period per regulatory need.
- Bucket policies allow write only from organization accounts and the logging services; no delete.
- KMS keys with a policy limited to the log delivery services and the security team.
- Athena and Glue catalog provide query access for the Security team (read-only, cross-account).
- Lifecycle rules move older logs to cheaper storage classes.
