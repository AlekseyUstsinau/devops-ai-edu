variable "project_name" {
  type        = string
  description = "Project name used to build resource names."
}

variable "environment" {
  type        = string
  description = "Deployment environment identifier."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets."
}

variable "azs" {
  type        = list(string)
  description = "Availability zones used by the VPC."
}

variable "create_nat_gateway" {
  type        = bool
  description = "Whether to create a single NAT gateway for private subnet outbound access."
}

variable "tags" {
  type        = map(string)
  description = "Standardized tags to apply to all network resources."
}
