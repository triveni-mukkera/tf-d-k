resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = local.instance_tenancy
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags = var.vpc_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = var.igw_tags
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone      = local.azs[count.index]

  tags = {
    Name = var.public_subnet_names[count.index]
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone      = local.azs[count.index]

  tags = {
    Name = var.private_subnet_names[count.index]
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
    tags = var.public_route_table_tags
 
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = var.private_route_table_tags
 
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.publicprivate_subnet_cidr)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

