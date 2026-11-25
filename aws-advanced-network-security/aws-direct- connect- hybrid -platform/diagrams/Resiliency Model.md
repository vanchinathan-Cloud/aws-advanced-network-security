
## Resiliency Model

```mermaid

flowchart LR

ONPREM

ONPREM --> DX1

ONPREM --> DX2

ONPREM -.Backup.-> VPN

DX1 --> AWS

DX2 --> AWS

VPN --> AWS
```