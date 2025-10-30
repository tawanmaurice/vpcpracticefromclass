resource "aws_eip" "nat" {
  domain = "vpc"
  tags   = { Name = "nat-eip" }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_3.id # was public_1; now aligned with new naming
  tags          = { Name = "nat-gateway" }
  depends_on    = [aws_internet_gateway.igw]
}

