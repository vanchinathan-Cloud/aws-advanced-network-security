
## Edge Security Flow
```mermaid

flowchart TB

USER[Internet User]

USER --> DNS[Route53]

DNS --> EDGE [CloudFront-WEB TRAFFIC]

CF --> WAF[AWS WAF]

WAF --> ALB[Application Load Balancer]

ALB --> FW

FW ---> APP[Web Application]
```