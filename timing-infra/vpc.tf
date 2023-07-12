module "this" {
    source = "../terraform-aws-vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    public_subnet_names = var.public_subnet_names
    private_subnet_cidr = var.private_subnet_cidr
    private_subnet_names = var.private_subnet_names
    vpc_tags = var.common_tags
    igw_tags = var.common_tags
    public_route_table_tags = merge(
        var.common_tags, 
        {
            Name = "timimg-public"
        }
    )
    private_route_table_tags = merge(
        var.common_tags, 
        {
            Name = "timimg-private"
        }
    )
}