resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.comman.id,
    aws_security_group.roboshop[count.index].id
  ]

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }

}

resource "aws_security_group" "comman" {
  name        = "${var.project}-${var.environment}-comman"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "${var.project}-${var.environment}-comman"
  }
}

resource "aws_security_group" "roboshop" {
  count  = 10
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "Component SG for the instance of roboshop"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}
