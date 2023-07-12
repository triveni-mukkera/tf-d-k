variable "vpc_cidr" {
   default = "10.0.0.0/16"
}

variable "common_tags" {
  type = map 
  default = {
      Name = "timing"
      Terraform = "true"
      Environment = "DEV"
  }
}


variable "public_subnet_cidr" {
  type = list 
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "public_subnet_names" {
  type = list 
  default = ["timing-public-2a","timing-public-2b"]
}

variable "private_subnet_cidr" {
  type = list 
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "private_subnet_names" {
  type = list 
  default = ["timing-private-2a","timing-private-2b"]
}