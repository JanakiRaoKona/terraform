resource "aws_instance" "expense" {
  for_each      = var.instance_names #each.key and each.value 
  ami           = data.aws_ami.ami_info.id
  instance_type = each.value 

  vpc_security_group_ids = ["sg-0c5f6fbf77d34fcf3"]

  tags = merge(var.comman_tags,
    { Name   = each.key
    Module = each.key
    }
  )

}



