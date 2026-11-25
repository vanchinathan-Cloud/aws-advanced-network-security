Enterprise Hybrid Transit Network
Overview
Enterprise hybrid networking architecture connecting on-premises data centers to AWS using Transit Gateway, VPN, BGP, Gateway Load Balancer, and AWS Network Firewall.

Architecture
flowchart TB

DC[Data Center]

DC --> VPN1[VPN Tunnel 1]
DC --> VPN2[VPN Tunnel 2]

VPN1 --> TGW
VPN2 --> TGW

TGW --> INSPECT[Inspection VPC]

INSPECT --> FW[Network Firewall]

TGW --> PROD[Production VPC]
TGW --> SHARED[Shared Services VPC]
Objectives
Hybrid Connectivity
Dynamic Routing
Centralized Inspection
High Availability
BGP Route Exchange
Components
Transit Gateway
Central Routing Hub

Site-to-Site VPN
Redundant IPSec tunnels

AWS Network Firewall
Traffic Inspection

Gateway Load Balancer
Third-party Security Appliance Integration

Traffic Flow
On-Premises

↓

VPN

↓

Transit Gateway

↓

Inspection VPC

↓

AWS Network Firewall

↓

Application VPC

Validation
Tunnel Failure
Expected: Traffic fails over to secondary tunnel

Result: PASS

Firewall Rule
Expected: Unauthorized traffic blocked

Result: PASS
