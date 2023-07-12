#security group for postgress RDS 5432
resource "aws_security_group" "allow_postgress" {
  name        = "allow_postgress"
  description = "Allow postgress inbound traffic"
  #vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = var.postgress_port
    to_port     = var.postgress_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_list
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
     var.tags,{
        Name = "timimg-sg"
     }
  )
}


