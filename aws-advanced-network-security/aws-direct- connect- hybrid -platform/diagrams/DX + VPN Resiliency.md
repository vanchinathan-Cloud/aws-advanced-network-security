```mermaid
DX + VPN Resiliency
flowchart LR

DC["Corporate Data Center"]

DX1["Primary Direct Connect"]
DX2["Secondary Direct Connect"]

VPN["VPN Backup"]

TGW["AWS Transit Gateway"]

DC --> DX1
DC --> DX2

DC -. Backup .-> VPN

DX1 --> TGW
DX2 --> TGW
VPN --> TGW
```