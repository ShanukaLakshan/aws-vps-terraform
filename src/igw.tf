# 3. Internet Gateway
# Create an internet gateway and attach it to the VPC

resource "aws_internet_gateway" "igw_vpc" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "Internet Gateway for VPC"
  }
}