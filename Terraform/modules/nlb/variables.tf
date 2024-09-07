variable "vpc_id" {
  description = "The VPC ID where the NLB and target group will be created"
  default = "vpc-0123456789abcdef0"  # Replace with the real VPC ID
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the Network Load Balancer"
  default = "subnet-0123456789abcdef0" # Replace with the real public subnet ID
  type        = string
}
