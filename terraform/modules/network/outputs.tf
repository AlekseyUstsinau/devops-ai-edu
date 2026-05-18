output "vpc_id" {
  description = "VPC identifier created by the network module."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs for the application load balancer."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks."
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "nat_gateway_ids" {
  description = "NAT gateway IDs for private subnet outbound access."
  value       = aws_nat_gateway.this[*].id
}
