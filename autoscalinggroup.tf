resource "aws_autoscaling_group" "app1_asg" {
  name                = "app1-asg"
  max_size            = 3
  min_size            = 1
  desired_capacity    = 2
  vpc_zone_identifier = [aws_subnet.private_10.id, aws_subnet.private_11.id]

  launch_template {
    id      = aws_launch_template.app1_LT.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app1_tg.arn]

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }
}
