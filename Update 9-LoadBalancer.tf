resource "aws_lb" "app1_alb" {
  name               = "app1-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app1_sg02_lb01.id]
  subnets            = [aws_subnet.public_3.id, aws_subnet.public_4.id]
}
