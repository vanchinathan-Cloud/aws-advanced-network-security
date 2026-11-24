# Routing

- Spoke route tables send 0.0.0.0/0 and all private ranges to the TGW attachment.
- Associated with TGW-RT-PROD; routes propagate only to Shared Services, On-Prem, DR, and Inspection.
- UAT and NonProd ranges are intentionally absent from TGW-RT-PROD.
