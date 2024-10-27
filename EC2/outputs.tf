output "instance_id" {
  value       = aws_instance.var.ec2_name.id
}

output "instance_state" {
  description = "The state of the EC2 instance (e.g., running, stopped)."
  value       = aws_instance.var.ec2_name.instance_state
}

output "instance_type" {
  description = "The type of EC2 instance (e.g., t2.micro, m5.large)."
  value       = aws_instance.var.ec2_name.instance_type
}

output "availability_zone" {
  description = "The Availability Zone where the EC2 instance is deployed."
  value       = aws_instance.var.ec2_name.availability_zone
}

output "public_dns" {
  description = "The public DNS name assigned to the EC2 instance."
  value       = aws_instance.var.ec2_name.public_dns
}

output "public_ip" {
  description = "The public IP address assigned to the EC2 instance."
  value       = aws_instance.var.ec2_name.public_ip
}

output "private_dns" {
  description = "The private DNS name assigned to the EC2 instance within its VPC."
  value       = aws_instance.var.ec2_name.private_dns
}

output "private_ip" {
  description = "The private IP address assigned to the EC2 instance within its VPC."
  value       = aws_instance.var.ec2_name.private_ip
}

output "monitoring" {
  description = "Indicates if detailed monitoring is enabled for the EC2 instance."
  value       = aws_instance.var.ec2_name.monitoring
}

output "security_group_ids" {
  description = "The list of security group IDs assigned to the EC2 instance."
  value       = aws_instance.var.ec2_name.vpc_security_group_ids
}

output "key_name" {
  description = "The name of the key pair associated with the EC2 instance."
  value       = aws_instance.var.ec2_name.key_name
}

output "subnet_id" {
  description = "The ID of the subnet to which the instance is attached."
  value       = aws_instance.var.ec2_name.subnet_id
}

output "tags" {
  description = "A map of tags assigned to the resource."
  value       = aws_instance.var.ec2_name.tags
}
