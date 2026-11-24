# Transit Gateway

- One TGW per region, owned by the Network account and shared with the organization via AWS RAM.
- Each spoke VPC attaches using dedicated small TGW attachment subnets (one per AZ).
- Default route table association and propagation are **disabled**; each attachment is associated explicitly with its environment route table.
- Appliance mode is enabled on the Inspection VPC attachment to keep flows symmetric across AZs.
- TGW flow logs are delivered to the Log Archive account.

## Route Tables
| Route Table | Associated Attachments | Purpose |
|---|---|---|
| TGW-RT-PROD | Production VPC | Production |
| TGW-RT-UAT | UAT VPC | UAT |
| TGW-RT-NONPROD | NonProd VPC | Development |
| TGW-RT-SHARED | Shared Services VPC | Shared Services |
| TGW-RT-SECURITY | Inspection VPC | Inspection |
| TGW-RT-ONPREM | DX Gateway / VPN | Hybrid connectivity |
| TGW-RT-DR | DR VPC | Disaster Recovery |
