# 2.create subnet
# 2.1. Create public and private subnets in the VPC
# 2.2. Create a public subnet in each availability zone
# 2.3. Create a private subnet in each availability zone
# In addition -> you can define the availability zones for the VPC in the variable.tf file and use it in the subnet.tf file.

variable "vpc_availability_zones" {
  type        = list(string)
  description = "Availability Zones for the VPC"
  default     = ["us-east-1a", "us-east-1b"]
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  count             = length(var.vpc_availability_zones)
  cidr_block        = cidrsubnet(aws_vpc.custom_vpc.cidr_block, 8, count.index + 1)
  availability_zone = element(var.vpc_availability_zones, count.index)
  tags = {
    Name = "Defined Public subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  count             = length(var.vpc_availability_zones)
  cidr_block        = cidrsubnet(aws_vpc.custom_vpc.cidr_block, 8, count.index + 3)
  availability_zone = element(var.vpc_availability_zones, count.index)
  tags = {
    Name = "Defined Private subnet ${count.index + 1}"
  }
}
