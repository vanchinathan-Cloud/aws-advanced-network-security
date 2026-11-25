VPN Failover

sequenceDiagram

participant DC

participant VPN1

participant VPN2

participant AWS

DC->>VPN1: Active Traffic

VPN1--xAWS: Tunnel Failure

DC->>VPN2: Automatic Reroute

VPN2->>AWS: Service Restored