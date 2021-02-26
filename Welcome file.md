README.md



![Terraform](https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg)

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.
-   Website:  [https://www.terraform.io]

Terraform module which creates VPC resources on AWS.

These types of resources are supported:

-   [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html)
    
-   [Subnet](https://www.terraform.io/docs/providers/aws/r/subnet.html)
    
-   [Route](https://www.terraform.io/docs/providers/aws/r/route.html)
    
-   [Route table](https://www.terraform.io/docs/providers/aws/r/route_table.html)
    
-   [Internet Gateway](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html)
    
    
-   [NAT Gateway](https://www.terraform.io/docs/providers/aws/r/nat_gateway.html)

    
*Terraform version: 0.14*

  

## terraform-aws-vpc
```
module "three-tier" {
  source        = "../"
  region        = "us-east-1"
  cidr_block    = "10.0.0.0/16"
  public_cidr1  = "10.0.101.0/24"
  public_cidr2  = "10.0.102.0/24"
  public_cidr3  = "10.0.103.0/24"
  private_cidr1 = "10.0.1.0/24"
  private_cidr2 = "10.0.2.0/24"
  private_cidr3 = "10.0.3.0/24"
  tags = {
    Name    = "VPC"
    Team    = "Fail Fast"
   
  }
}
```

***

### Get the output

```
output "vpc_id" {
    value = module.three-tier.vpc
}
output "public" {
    value = module.three-tier.public_subnets
}
output "private" {
    value = module.three-tier.private_subnets
}
output "region" {
    value = module.three-tier.region
}
```



**![](https://lh3.googleusercontent.com/c2lSElpvxKLnwqtpAjtd7bG9dj6yE8lR4MVaarENzqANR40w5uJm9038cFYz9AM-9e09f1gOkNdFjEQ5xlqxfw4VwMYW0Wwc9GwQP9l5Kba9Cb_YoZ63_wxpPGWDleEaRmn_tZxBbx4)**




<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyMjY5NzAwOTgsLTEyMjc1NjA5NzksLT
IwMzgzMTczMzYsNzY5ODY2NjYsLTYxMjEzOTQ3MV19
-->