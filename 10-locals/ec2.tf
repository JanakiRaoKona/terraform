resource "aws_instance" "locals_demo" {
  ami                    = var.ami
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.locals_demo.id]

  tags = local.ec2_tags

}

resource "aws_security_group" "locals_demo" {
  name        = "locals_demo"
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
    name = local.ec2_tags.Name
  }
}
