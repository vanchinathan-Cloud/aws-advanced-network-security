Diagram 1: Edge Security Layer

flowchart TB

USER[Internet User]

USER --> DNS[Route53]

DNS --> CF[CloudFront]

CF --> WAF[AWS WAF]

WAF --> ALB[Application Load Balancer]

ALB --> APP[Application]