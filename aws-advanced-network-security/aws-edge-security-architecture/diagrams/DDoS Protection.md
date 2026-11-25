## DDoS Protection

```mermaid
flowchart LR

ATTACKER[DDoS Traffic]

ATTACKER --> SHIELD[AWS Shield]

SHIELD --> CloudFront[CloudFront]

CloudFront --> APPLICATION
```