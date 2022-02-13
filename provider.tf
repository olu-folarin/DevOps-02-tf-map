// meant to replace the default vpc
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}