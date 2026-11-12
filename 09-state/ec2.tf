resource "aws_instance" "state_demo" {
  ami                    = data.aws_ami.join_devops.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.state_demo.id]

  tags = var.ec2_tags

}

resource "aws_security_group" "state_demo" {
  name        = "roboshop-state-demo-01"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = var.from_port
    to_port     = var.from_port
    protocol    = "-1"
    cidr_blocks = var.cidr

  }


  tags = {
    Name = "roboshop-state-demo"
  }

  lifecycle {
    create_before_destroy = true
  }
}
