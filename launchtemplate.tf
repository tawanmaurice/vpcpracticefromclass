resource "aws_launch_template" "app1_LT" {
  name_prefix   = "app1-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.app1_sg01_servers.id]

  tag_specifications {
    resource_type = "instance"
    tags          = { Name = "app1-instance" }
  }
}
