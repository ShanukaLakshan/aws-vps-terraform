# 7. NAT Gateway
# Create a NAT Gateway and associate it with the private subnet
# This resource depends on the internet gateway.

resource "aws_nat_gateway" "custom-nat-gateway" {
  subnet_id     = element(aws_subnet.private_subnet[*].id, 0)
  allocation_id = aws_eip.eip.id
  depends_on    = [aws_internet_gateway.igw_vpc]
  tags = {
    Name = "NAT Gateway for VPC"
  }
}