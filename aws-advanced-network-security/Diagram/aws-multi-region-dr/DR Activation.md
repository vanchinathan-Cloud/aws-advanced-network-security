Diagram 4: DR Activation

sequenceDiagram

participant User

participant Route53

participant Primary

participant DR

User->>Primary: Application Request

Primary--xUser: Region Failure

Route53->>DR: Redirect Traffic

DR->>User: Service Restored