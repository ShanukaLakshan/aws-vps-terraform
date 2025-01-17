# 1. create vpc 
# You need to define the VPC CIDR block
# You can enable DNS support and DNS hostnames
# You can also add tags to the VPC

resource "aws_vpc" "custom_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Your VPC Name"
  }
}





















































