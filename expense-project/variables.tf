# preference 
# 1. command line arguments 
# 2 . .tfvars 
# 3 . default variables 

variable "instance_names" {

  type    = list(any)
  default = ["db", "backend", "frontend"]

}

variable "image_id" {
  type        = string                  # optional
  description = "RHEL-9 Image ID"       # optional
  default     = "ami-0220d79f3f480ecf5" # optional
}

variable "instance_type" {
  type        = string
  description = "t3 micro"
  default     = "t3.micro"
}

variable "comman_tags" {
  default = {
    Environment = "Dev"
    Project     = "Expense"
    Terraform  = true
  }

}

variable "sg-name" {
  default = "allow_ssh"
}

variable "sg-description" {
  default = "allowing ssh access"
}

variable "ssh-port" {
  default = 22
}

variable "protocol" {
  default = "tcp"

}

variable "allow_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
