Data Replication

flowchart LR

DDB1[DynamoDB Global Table]

DDB2[DynamoDB Replica]

DDB1 <--> DDB2

S3A[S3 Primary]

S3B[S3 Replica]

S3A <--> S3B