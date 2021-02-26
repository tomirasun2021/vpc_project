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

**1. Create a VPC**

Create a VPC The really first stage for bootstrapping an AWS account is to create a VPC ([https://www.terraform.io/docs/providers/aws/r/vpc.html](https://www.terraform.io/docs/providers/aws/r/vpc.html))

```
1. resource "aws_vpc" "main" {
2. cidr_block = var.cidr_block
3. tags = var.tags
4. }
```













<!--stackedit_data:
eyJoaXN0b3J5IjpbNzY5ODY2NjYsLTYxMjEzOTQ3MV19
-->