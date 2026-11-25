## Shared Services

```mermaid

flowchart TB

PRD[Production]

UAT[UAT]

DEV[Development]

PRD --> TGW

UAT --> TGW

DEV --> TGW

TGW --> SHARED[Shared Services VPC]

SHARED --> SSM

SHARED --> KMS

SHARED --> ECR

SHARED --> SECRETS
```