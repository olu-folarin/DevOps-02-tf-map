// meant to replace the default vpc
resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}