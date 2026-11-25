Diagram 4: Centralized Endpoint Architecture

flowchart TB

PRD[Production VPC]

UAT[UAT VPC]

DEV[Development VPC]

PRD --> TGW

UAT --> TGW

DEV --> TGW

TGW --> SHARED[Shared Services VPC]

SHARED --> SSM[SSM Endpoint]

SHARED --> KMS[KMS Endpoint]

SHARED --> SECRETS[Secrets Manager Endpoint]

SHARED --> ECR[ECR Endpoint]