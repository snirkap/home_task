resource "aws_instance" "test_ec2" {
  ami           = var.ami 
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = <<-EOF
          #!/bin/bash
          sudo yum update -y
          sudo yum install httpd -y
          sudo systemctl start httpd
          sudo systemctl enable httpd
          EOF
  
  tags = {
    Name = "TestEC2"
  }
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.test_ec2_nic.id
  }

  vpc_security_group_ids = [aws_security_group.test_ec2_sg.id]
}

resource "aws_network_interface" "test_ec2_nic" {
  subnet_id       = var.subnet_id
  private_ips     = [var.private_ip]

  security_groups = [aws_security_group.test_ec2_sg.id]
}

resource "aws_security_group" "test_ec2_sg" {
  name        = "test-ec2-sg"
  description = "Allow HTTP access only from Leumi proxy IP (91.231.246.50)"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["91.231.246.50/32"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-ec2-sg"
  }
}
