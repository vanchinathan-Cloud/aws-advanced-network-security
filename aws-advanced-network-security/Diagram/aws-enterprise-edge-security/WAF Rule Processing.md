WAF Rule Processing

flowchart TB

REQUEST[Incoming Request]

REQUEST --> WAF

WAF --> SQLI[SQL Injection Check]

WAF --> XSS[XSS Check]

WAF --> GEO[Geo Restriction]

SQLI --> ALLOW

XSS --> ALLOW

GEO --> BLOCK