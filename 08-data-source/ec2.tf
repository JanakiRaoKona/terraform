resource "aws_instance" "data_source" {
  ami                    = data.aws_ami.join_devops.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.data_source.id]

  tags = var.ec2_tags

}

resource "aws_security_group" "data_source" {
  name        = "roboshop-data-source-demo"
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
    Name = "roboshop-data-source-demo"
  }
}
