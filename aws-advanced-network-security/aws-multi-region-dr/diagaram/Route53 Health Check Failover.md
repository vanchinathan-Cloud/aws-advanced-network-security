Route53 Health Check Failover

flowchart TB

USER

USER --> R53[Route53]

R53 --> PRIMARY[Primary Region]

R53 --> DR[Disaster Recovery Region]