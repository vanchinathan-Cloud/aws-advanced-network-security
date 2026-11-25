## Route53 Failover

```mermaid 

flowchart TB

CLIENT

CLIENT --> R53[Route53]

R53 --> PRIMARY[Primary Region]

R53 --> SECONDARY[DR Region]
```