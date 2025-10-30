# Private RT -> NAT
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = { Name = "private-rt" }
}

# Public RT -> IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "public-rt" }
}

# Associations
resource "aws_route_table_association" "pub_assoc_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub_assoc_4" {
  subnet_id      = aws_subnet.public_4.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "priv_assoc_10" {
  subnet_id      = aws_subnet.private_10.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "priv_assoc_11" {
  subnet_id      = aws_subnet.private_11.id
  route_table_id = aws_route_table.private.id
}

