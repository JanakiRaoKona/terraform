variable "instance_names" {
  type = map(string)
  default = {
    db       = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }

}

variable "comman_tags" {
  type = map(string)
  default = {
    Environment = "Dev"
    Project     = "Expense"
    Terraform   = true
  }

}

# route 53 vars 
variable "domain_name" {
    default  = "janakiraodevopsapps.fun"
  
}

variable "zone_id" {
  type    = string
  default = "Z00588741QLSSEFMFWBTX"

}