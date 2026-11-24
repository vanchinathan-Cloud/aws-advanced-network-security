# Non-Production Account

## Purpose
Development and sandbox environments.

## Architecture
```mermaid
flowchart LR
    DevTeam["Developers"] --> DEV["Dev/Test VPC"]
    DEV --> TGW["Transit Gateway"]
    TGW --> Shared["Shared Services"]
```

## CIDR
10.30.128.0/17

## Contains
Developer sandboxes · Feature testing · Training labs · Automation testing

## Security Controls
- Internet through the inspection firewall
- No Production access

See [Dev-Test-Network](Dev-Test-Network.md).
