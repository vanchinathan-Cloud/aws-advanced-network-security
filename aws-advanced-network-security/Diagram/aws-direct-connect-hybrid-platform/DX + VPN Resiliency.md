Diagram 2: DX + VPN Resiliency

flowchart LR

ONPREM

ONPREM --> DX1

ONPREM --> DX2

ONPREM -.Backup.-> VPN

DX1 --> AWS

DX2 --> AWS

VPN --> AWS