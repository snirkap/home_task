resource "aws_lb" "nlb" {
  name               = "test-ec2-nlb"
  internal           = false  
  load_balancer_type = "network"
  subnet_mapping {
    subnet_id = var.subnet_ids
  }

  enable_deletion_protection = false

  tags = {
    Name = "TestEC2-NLB"
  }
}

resource "aws_lb_target_group" "test_ec2_tg" {
  name     = "test-ec2-target-group"
  port     = 80
  protocol = "TCP"  
  vpc_id   = var.vpc_id

  health_check {
    protocol            = "HTTP"
    path                = "/"
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "TestEC2-Target-Group"
  }
}

resource "aws_lb_target_group_attachment" "test_ec2_tg_attachment" {
  target_group_arn = aws_lb_target_group.test_ec2_tg.arn
  target_id        = aws_instance.test_ec2.id
  port             = 80
}

# Create a listener for the NLB
resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 80
  protocol          = "TCP"  # Use TCP for NLB
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_ec2_tg.arn
  }
}

# Output the DNS name of the Network Load Balancer
output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value       = aws_lb.nlb.dns_name
}
