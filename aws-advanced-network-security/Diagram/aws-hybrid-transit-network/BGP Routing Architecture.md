BGP Routing Architecture

flowchart LR

ROUTER[Corporate Router]

ROUTER <-->|eBGP| VPN[AWS VPN]

VPN <-->|Route Propagation| TGW

TGW --> PROD

TGW --> SHARED