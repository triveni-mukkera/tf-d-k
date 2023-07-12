# variable "instance_names" {
#   type    = list(any)
#   default = ["web", "api", "db"]
# }

variable "tags" {
  type = map(string)
  default = {
    Name      = "timing"
    Env       = "DEV"
    Terrafrom = "true"
  }
}

# variable "isprod" {
#   type    = bool
#   default = false
# }

# variable "env" {
#   type    = string
#   default = "prod"
# }

variable "postgress_port" {
  type = number
  default = 5342
  }
  
  variable "cidr_list" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
  }
