Diagram 3: BGP Route Exchange

flowchart LR

ROUTER[Corporate Router]

ROUTER <-->|BGP| VPN[Virtual Private Gateway]

VPN <-->|Route Propagation| TGW

TGW --> AWS[AWS VPCs]