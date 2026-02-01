variable "image_id" {
  type        = string # optional
  description = "RHEL-9 Image ID" # optional
  default     = "ami-0220d79f3f480ecf5" # optional
}

variable "instance_type" {
  type  =  string 
  description  = "t3 micro"
  default  = "t3.micro"
}

variable "tags" {
  default  = {
    Name = "DB"
    Module  = "DB"
    Environment = "Dev"
    Project  = "Expense"
  }
  
}