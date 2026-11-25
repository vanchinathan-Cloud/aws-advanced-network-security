Diagram 2: DDoS Protection

flowchart LR

ATTACKER[DDoS Traffic]

ATTACKER --> SHIELD[AWS Shield]

SHIELD --> CF[CloudFront]

CF --> APPLICATION