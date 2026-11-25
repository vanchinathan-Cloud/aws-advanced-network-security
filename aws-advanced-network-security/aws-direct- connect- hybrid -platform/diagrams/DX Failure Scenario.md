##  DX Failure Scenario

```mermaid

sequenceDiagram

participant DC

participant DX1

participant DX2

participant AWS

DC->>DX1: Production Traffic

DX1--xAWS: Circuit Failure

DC->>DX2: Automatic Reroute

DX2->>AWS: Connectivity Restored
```