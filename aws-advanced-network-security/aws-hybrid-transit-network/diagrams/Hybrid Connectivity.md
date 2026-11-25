Diagram 1: Hybrid Connectivity

flowchart TB

DC[Corporate Data Center]

DC --> VPN1[VPN Tunnel 1]

DC --> VPN2[VPN Tunnel 2]

VPN1 --> TGW

VPN2 --> TGW

TGW --> PROD[Production VPC]

TGW --> SHARED[Shared Services VPC]