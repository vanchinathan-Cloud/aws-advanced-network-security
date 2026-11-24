# Security Hub

- Delegated administrator for the organization with auto-enable for new accounts.
- Standards: AWS Foundational Security Best Practices and CIS benchmarks (PCI DSS where applicable).
- Aggregates findings from GuardDuty, Inspector, Macie, IAM Access Analyzer, and Firewall Manager.
- Cross-region aggregation to the primary region.
- High-severity findings routed to the SOC via EventBridge.
