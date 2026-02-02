# preference 
# 1. command line arguments env variables
# 2 . .tfvars 
# 3 . default variables 


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

variable "tags" {
  default = {
    Name        = "DB"
    Module      = "DB"
    Environment = "Dev"
    Project     = "Expense"
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
