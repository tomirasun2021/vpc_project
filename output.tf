output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "private_subnet1" {
  value = "${aws_subnet.subnet1.id}"
}

output "private_subnet2" {
  value = "${aws_subnet.subnet2.id}"
}

output "private_subnet3" {
  value = "${aws_subnet.subnet3.id}"
}

output "public_subnet1" {
  value = "${aws_subnet.subnet101.id}"
}

output "public_subnet2" {
  value = "${aws_subnet.subnet102.id}"
}

output "public_subnet3" {
  value = "${aws_subnet.subnet103.id}"
}

output "tags" {
  value = "${var.tags}"
}