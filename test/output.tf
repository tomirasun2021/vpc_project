output "vpc_id" {
  value = "${module.VPC.vpc_id}"
}

output "private_subnet1" {
  value = "${module.VPC.private_subnet1}"
}
output "private_subnet2" {
  value = "${module.VPC.private_subnet2}"
}
output "private_subnet3" {
  value = "${module.VPC.private_subnet3}"
}
output "public_subnet1" {
  value = "${module.VPC.private_subnet1}"
}

output "public_subnet2" {
  value = "${module.VPC.private_subnet2}"
}

output "public_subnet3" {
  value = "${module.VPC.private_subnet3}"
}

output "tags" {
  value = "${module.VPC.tags}"
}