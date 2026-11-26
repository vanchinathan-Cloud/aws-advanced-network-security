Enterprise Direct Connect Hybrid Platform


Overview
Enterprise hybrid connectivity architecture integrating on-premises data centers with AWS through Direct Connect, Direct Connect Gateway, Transit Gateway, Route53 Resolver, and VPN backup.

Architecture
flowchart TB

DC[Corporate Data Center]

DC --> DX1[Direct Connect Primary]

DC --> DX2[Direct Connect Secondary]

DX1 --> DXGW[Direct Connect Gateway]
DX2 --> DXGW

DXGW --> TGW[Transit Gateway]

TGW --> PROD[Production VPC]

TGW --> SHARED[Shared Services VPC]

TGW --> DR[Disaster Recovery VPC]

VPN[VPN Backup]

VPN --> TGW
Business Requirements
Private Connectivity
Redundant Routing
Regulatory Compliance
Disaster Recovery
Hybrid DNS
Connectivity Design
Primary Path
Data Center

↓

Direct Connect

↓

DX Gateway

↓

Transit Gateway

↓

AWS Workloads

Backup Path
Data Center

↓

VPN

↓

Transit Gateway

↓

AWS Workloads

BGP Routing
Dynamic Route Advertisement
Route Propagation
Route Filtering
Route Summarization
Validation
DX Failure
Expected: Traffic moves to Secondary DX

Status: PASS

Dual DX Failure
Expected: Traffic switches to VPN

Status: PASS

BGP Failure
Expected: Route Withdrawal

Status: PASS

Operational Runbooks
Direct Connect Failure
BGP Neighbor Down
DR Activation
DNS Failover
VPN Emergency Recovery

AWS site-site VPN Check list:

If you have an AWS Site-to-Site VPN where Tunnel 1 is UP and Tunnel 2 is DOWN, I would troubleshoot from both the AWS side and the customer gateway (on-premises firewall/router) side.

"When one AWS Site-to-Site VPN tunnel is up and the secondary tunnel is down.
I first verify the peer IP, PSK, IKE/IPsec proposals, and firewall connectivity (UDP 500, UDP 4500, ESP). 
Next, I check whether the tunnel fails during IKE negotiation, IPsec SA establishment, or BGP adjacency formation. 
I review customer gateway logs and AWS VPN tunnel logs in CloudWatch to identify proposal mismatches, authentication failures, routing issues, or blocked ports. Since AWS provides two tunnels for redundancy, I ensure both tunnels are independently configured according to the AWS-generated VPN configuration file."
