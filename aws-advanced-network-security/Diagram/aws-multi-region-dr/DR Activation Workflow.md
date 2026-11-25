DR Activation Workflow

sequenceDiagram

participant User

participant Route53

participant Primary

participant DR

User->>Primary: Application Request

Primary--xUser: Region Failure

Route53->>DR: Redirect Traffic

DR->>User: Application Available