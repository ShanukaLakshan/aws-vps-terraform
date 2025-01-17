# 6. Elastic IP 
# This EIP is associated with the NAT Gateway
resource "aws_eip" "eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw_vpc]
}
