// subnet ids
data "aws_subnet_ids" "default_subnets" {
  vpc_id = aws_default_vpc.default.id
}

// ami data provider
data "aws_ami" "latest_aws_linux_2" {
    
}