variable "instance_type" {
  description = "The type of instance to create (e.g., t2.micro)"
  default = "t2.micro"
  type        = string
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  default = "ami-0c55b159cbfafe1f0"
  type        = string
}

variable "key_name" {
  description = "The key pair name to associate with the EC2 instance for SSH access"
  default = "your-key-pair"  # Replace with the real key pair name
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  default = "subnet-0123456789abcdef0"  # Replace with the real subnet ID
  type        = string
}

variable "private_ip" {
  description = "The fixed private IP address for the EC2 instance"
  default = ["10.0.0.50"]  # Fixed private IP (VIP)
  type        = string
}
