Diagram 4: Failure Scenario

sequenceDiagram

participant DC as Data Center

participant VPN1

participant VPN2

participant AWS

DC->>VPN1: Primary Traffic

VPN1--xAWS: Tunnel Failure

DC->>VPN2: Automatic Failover

VPN2->>AWS: Traffic Restored