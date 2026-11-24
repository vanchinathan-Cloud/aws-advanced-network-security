# OU Structure

```mermaid
flowchart TD
    ROOT["Root"] --> SEC["Security OU"]
    ROOT --> INF["Infrastructure OU"]
    ROOT --> WL["Workloads OU"]
    SEC --> SECA["Security Account"]
    SEC --> LOGA["Log Archive Account"]
    INF --> NETA["Network Account"]
    INF --> SHRA["Shared Services Account"]
    WL --> PROD["Prod OU"]
    WL --> NONP["NonProd OU"]
    PROD --> PRDA["Production Account"]
    PROD --> DRA["DR Account"]
    NONP --> UATA["UAT Account"]
    NONP --> DEVA["NonProd Account"]
```

## Notes
- DR sits with Production so it inherits the same production-grade SCPs.
- UAT and NonProd share an OU but remain separate accounts and separate CIDRs.
- See [SCP-Strategy](SCP-Strategy.md) for guardrails attached at each level.
