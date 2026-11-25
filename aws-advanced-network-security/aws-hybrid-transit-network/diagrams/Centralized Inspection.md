## Centralized Inspection

```mermaid 

flowchart LR

ONPREM[On-Prem]

ONPREM --> TGW

TGW --> INSPECTION[Inspection VPC]

INSPECTION --> GWLB[Gateway Load Balancer]

GWLB --> FW[AWS Network Firewall]

FW --> PROD[Application VPC]
```