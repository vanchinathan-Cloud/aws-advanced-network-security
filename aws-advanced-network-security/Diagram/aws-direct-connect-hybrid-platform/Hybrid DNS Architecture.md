Hybrid DNS Architecture

flowchart LR

APP[Application]

APP --> R53[Route53 Resolver]

R53 --> INBOUND[Inbound Endpoint]

INBOUND --> DNS[On-Prem DNS]

DNS --> AD[Active Directory]