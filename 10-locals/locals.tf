locals {
  instance_type = "t3.micro"
  Name          = "${var.project}-${var.environment}"

  comman_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = true
  }


  ec2_tags = merge(
    local.comman_tags,
    {
      Name = "${local.Name}-locals-demo"
    }
  )

}
