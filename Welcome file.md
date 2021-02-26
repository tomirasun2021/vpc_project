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

**2. Create public and private Subnets**

Then create public and private subnets in each AZs
(https://www.terraform.io/docs/providers/aws/r/subnet.html)

**For public subnets**

  

 1. resource "aws_subnet" "public1" {
            vpc_id = aws_vpc.main.id
        	cidr_block = var.public_cidr1
        	availability_zone = data.aws_availability_zones.available.names[0]
        	map_public_ip_on_launch = true
        	tags = var.tags
        }
        
        resource "aws_subnet" "public2" {
        	vpc_id = aws_vpc.main.id
        	cidr_block = var.public_cidr2
        	availability_zone = data.aws_availability_zones.available.names[1]
        	map_public_ip_on_launch = true
        	tags = var.tags
        }
        resource "aws_subnet" "public3" {
        	vpc_id = aws_vpc.main.id
        	cidr_block = var.public_cidr3
        	availability_zone = data.aws_availability_zones.available.names[2]
        	map_public_ip_on_launch = true
        	tags = var.tags
        }

<!--stackedit_data:
eyJoaXN0b3J5IjpbNDgyNDc3NDY4LC02MTIxMzk0NzFdfQ==
-->