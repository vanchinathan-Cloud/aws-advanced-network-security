## BGP Route Exchange

```mermaid

flowchart LR

ROUTER[Corporate Router]

ROUTER <-->|BGP| VPN[Virtual Private Gateway]

VPN <-->|Route Propagation| TGW

TGW --> AWS[AWS VPCs]
```