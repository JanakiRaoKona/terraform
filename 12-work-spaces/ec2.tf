resource "aws_instance" "work_spaces_demo" {
  ami                    = data.aws_ami.join_devops.id
  instance_type          = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.work_spaces_demo.id]

  tags = {
    Name = "roboshop-workspaces-demo-${terraform.workspace}"
  }

}

resource "aws_security_group" "work_spaces_demo" {
  name        = "roboshop-workspaces-demo-${terraform.workspace}"
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
    Name = "roboshop-workspaces-demo-${terraform.workspace}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
