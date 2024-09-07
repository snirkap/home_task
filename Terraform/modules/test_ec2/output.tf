output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.test_ec2.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.test_ec2.public_ip
}

output "private_ip" {
  description = "The private IP of the EC2 instance"
  value       = aws_network_interface.test_ec2_nic.private_ips
}

output "security_group_id" {
  description = "The security group ID attached to the EC2 instance"
  value       = aws_security_group.test_ec2_sg.id
}