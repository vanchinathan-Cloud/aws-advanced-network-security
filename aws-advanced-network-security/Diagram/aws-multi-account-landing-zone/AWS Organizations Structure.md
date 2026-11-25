Diagram 1: AWS Organizations Structure

flowchart TB

ROOT[AWS Organization Root]

ROOT --> INFRA[Infrastructure OU]
ROOT --> PROD[Production OU]
ROOT --> NONPROD[Non-Production OU]
ROOT --> DR[Disaster Recovery OU]

INFRA --> NET[Network Account]
INFRA --> SEC[Security Account]
INFRA --> SHARED[Shared Services Account]

PROD --> PRODAPP[Production Account]

NONPROD --> UAT[UAT Account]
NONPROD --> DEV[Development Account]

DR --> DRACC[DR Account]