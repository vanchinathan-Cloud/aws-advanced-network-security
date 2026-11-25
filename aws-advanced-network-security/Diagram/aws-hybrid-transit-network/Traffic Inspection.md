Traffic Inspection

flowchart LR

ONPREM[On-Premises]

ONPREM --> TGW

TGW --> INSPECTION[Inspection VPC]

INSPECTION --> GWLB[Gateway Load Balancer]

GWLB --> NFW[AWS Network Firewall]

NFW --> APP[Application VPC]