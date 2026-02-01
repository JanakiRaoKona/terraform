# resource <resource-type> <resource-name>

resource "aws_security_group" "allow_ssh" { 
    name = "allow_ssh"
    description = "allowing ssh access"

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

    egress {
        from_port        = 0 # from port 0 to 0 means opening all protocols ex: http https ssh tcp
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
       
    }
    tags  = {
        Name = "allow_ssh"
        CreatedBy = "Janaki Rao"

    }
}

resource "aws_instance" "db" {
    ami           = var.image_id
    instance_type = var.instance_type
    # left side things are called arguments right side variale values 

    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = var.tags 
  
}