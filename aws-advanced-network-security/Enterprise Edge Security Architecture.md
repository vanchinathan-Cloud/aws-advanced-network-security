Enterprise Edge Security Architecture
Overview
Enterprise internet edge architecture protecting public applications using Route53, CloudFront, AWS WAF, Shield Advanced, ALB, and Global Accelerator.

Architecture
flowchart TB

USER[Internet]

USER --> DNS[Route53]

DNS --> CF[CloudFront]

CF --> WAF[AWS WAF]

WAF --> ALB[Application Load Balancer]

ALB --> APP[Application]

SHIELD[AWS Shield]

SHIELD -. Protection .-> CF
SHIELD -. Protection .-> ALB
Security Layers
Layer 1

Route53

Layer 2

CloudFront

Layer 3

AWS WAF

Layer 4

Shield Advanced

Layer 5

ALB Security

Threat Scenarios
SQL Injection
Status: Blocked

Cross Site Scripting
Status: Blocked

DDoS
Status: Mitigated

Validation
WAF Rules: PASS

CloudFront Caching: PASS

Shield Visibility: PASS
