// subnet ids
data "aws_subnet_ids" "default_subnets" {
  vpc_id = aws_default_vpc.default.id
}

// ami data provider
data "aws_ami" "latest_aws_linux_2" {
  most_recent = true
  owners = ["amazon"]
  filter {
      name = "name"
      values = ["amzn2-ami-hvm-*"]
  }
}

// get the latest ami ids
data "aws_ami_ids" "latest_aws_linux_2_ids" {
    owners = ["amazon"] 
}