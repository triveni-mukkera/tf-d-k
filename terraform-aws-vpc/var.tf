variable "vpc_cidr" {
  type = string
  # you want to force users to provide the value
  default = "10.0.0.0/16"
}

# tags is not mandatory, users can or can't provide
variable "vpc_tags" {
  type = map 
  default = {}
}

variable "igw_tags" {
  type = map 
  default = {}
}

variable "public_subnet_cidr" {
  type = list 
  #default = []
   validation {
    condition = (
      length(var.public_subnet_cidr) == 2
    )
    
    error_message = "Must be valid 2 CIDR."
  }
}

variable "public_subnet_names" {
  type = list 
  #default = []
   validation {
    condition = (
      length(var.public_subnet_names) == 2
    )
    
    error_message = "Must be valid 2 names."
  }
}

variable "private_subnet_cidr" {
  type = list 
  #default = []
   validation {
    condition = (
      length(var.private_subnet_cidr) == 2
    )
    
    error_message = "Must be valid 2 CIDR."
  }
}

variable "private_subnet_names" {
  type = list 
  #default = []
   validation {
    condition = (
      length(var.private_subnet_names) == 2
    )
    
    error_message = "Must be valid 2 names."
  }
}

variable "public_route_table_tags" {
  type = map 
  default = {}
}


variable "private_route_table_tags" {
  type = map 
  default = {}
}


