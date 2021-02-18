resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = "${var.tags}"
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.subnet101.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.subnet102.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.subnet103.id}"
  route_table_id = "${aws_route_table.r.id}"
}