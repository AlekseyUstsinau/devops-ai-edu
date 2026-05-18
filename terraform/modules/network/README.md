# Network Module

This module creates the AWS networking foundation for an environment.

## What it creates

- VPC with DNS support enabled
- Internet Gateway
- Public and private subnets across availability zones
- NAT Gateways for private subnet egress
- Route tables and route associations

## Inputs

- `project_name`: Project identifier for naming resources
- `environment`: Deployment environment name
- `vpc_cidr`: VPC CIDR block
- `public_subnet_cidrs`: Public subnet CIDR blocks
- `private_subnet_cidrs`: Private subnet CIDR blocks
- `azs`: Availability zones to deploy into
- `create_nat_gateway`: Whether NAT gateways should be created
- `tags`: Standardized tags for all network resources

## Outputs

- `vpc_id`
- `public_subnet_ids`
- `private_subnet_ids`
- `nat_gateway_ids`

## Design notes

This module uses `for_each` to create subnets and NAT gateways in a predictable, AZ-aware way. It enforces least privilege by only exposing public internet access where required and by routing private subnets through NAT gateways.
