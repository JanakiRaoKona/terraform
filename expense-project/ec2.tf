# resource <resource-type> <resource-name>

resource "aws_instance" "expense" {
  count         = length(var.instance_names)
  ami           = var.image_id
  instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
  # left side things are called arguments right side variale values 

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = merge(var.comman_tags,
    { Name   = var.instance_names[count.index]
      Module = var.instance_names[count.index]
    }
  )

}

resource "aws_security_group" "allow_ssh" {
  name        = var.sg-name
  description = var.sg-description
  # this ingress code called block
  ingress {
    from_port   = var.ssh-port
    to_port     = var.ssh-port
    protocol    = var.protocol
    cidr_blocks = var.allow_cidr

  }

  egress {
    from_port   = 0 # from port 0 to 0 means opening all protocols ex: http https ssh tcp
    to_port     = 0
    protocol    = "-1" # -1 all protocols
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name      = "allow_ssh"
    CreatedBy = "Janaki Rao"

  }
}


