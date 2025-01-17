# This file creates a route table for public subnet and private subnet. It also associates the route table with the respective subnets.
# It depends on the internet gateway and NAT gateway.

# 4. Route table for public subnet
resource "aws_route_table" "route_table_public_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc.id
  }
  tags = {
    Name = "Public subnet Route Table"
  }
}

# 5.Route table association with public subnet
resource "aws_route_table_association" "public_subnet_association" {
  route_table_id = aws_route_table.route_table_public_subnet.id
  count          = length(var.vpc_availability_zones)
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
}

# 8. Route table for Private subnet
resource "aws_route_table" "route_table_private_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.custom-nat-gateway.id
  }
  depends_on = [aws_nat_gateway.custom-nat-gateway]
  tags = {
    Name = "Private subnet Route Table"
  }
}

# 9. Route table association with private subnet
resource "aws_route_table_association" "private_subnet_association" {
  route_table_id = aws_route_table.route_table_private_subnet.id
  count          = length(var.vpc_availability_zones)
  subnet_id      = element(aws_subnet.private_subnet[*].id, count.index)
}
