variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "common_tags" {
  type = map(string)
  default = {
    Name        = "timing"
    Terraform   = "true"
    Environment = "DEV"
  }
}

variable "project_name" {
  type    = string
  default = "timing"
}

variable "postgress_port" {
  type    = number
  default = 5432
}

variable "cidr_list" {
  type    = list(any)
  default = ["10.0.1.0/24"]
}
