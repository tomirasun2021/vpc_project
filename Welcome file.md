# *Readme.md*



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





<!--stackedit_data:
eyJoaXN0b3J5IjpbMzM3ODIyNDU0LC0yMDM4MzE3MzM2LDc2OT
g2NjY2LC02MTIxMzk0NzFdfQ==
-->