Edge Security Flow

flowchart TB

USER[Internet User]

USER --> DNS[Route53]

DNS --> CF[CloudFront]

CF --> WAF[AWS WAF]

WAF --> ALB[Application Load Balancer]

ALB --> APP[Web Application]