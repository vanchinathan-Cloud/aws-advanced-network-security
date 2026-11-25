Diagram 1: Enterprise DX Architecture

flowchart TB

DC[Corporate Data Center]

DC --> DX1[Direct Connect 1]

DC --> DX2[Direct Connect 2]

DX1 --> DXGW[DX Gateway]

DX2 --> DXGW

DXGW --> TGW[Transit Gateway]

TGW --> PROD[Production VPC]

TGW --> SHARED[Shared Services VPC]
