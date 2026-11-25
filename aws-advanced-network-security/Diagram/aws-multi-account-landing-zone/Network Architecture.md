Network Architecture

flowchart LR

TGW[Transit Gateway]

TGW --> PROD[Production VPC]
TGW --> UAT[UAT VPC]
TGW --> DEV[Development VPC]
TGW --> SHARED[Shared Services]

PROD --> SHARED
UAT --> SHARED
DEV --> SHARED

PROD -.Blocked.-> UAT