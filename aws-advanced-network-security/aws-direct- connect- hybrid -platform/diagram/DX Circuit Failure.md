DX Circuit Failure

sequenceDiagram

participant DC

participant DX1

participant DX2

participant AWS

DC->>DX1: Production Traffic

DX1--xAWS: Circuit Down

DC->>DX2: Failover

DX2->>AWS: Connectivity Maintained