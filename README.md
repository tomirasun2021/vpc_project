README.MD
[![Terraform](https://camo.githubusercontent.com/67a5f8c23e17abe7c416d4a93edb99e090bc9701879d596acd017ae846252a7b/68747470733a2f2f7777772e7465727261666f726d2e696f2f6173736574732f696d616765732f6c6f676f2d6861736869636f72702d33663130373332662e737667)](https://camo.githubusercontent.com/67a5f8c23e17abe7c416d4a93edb99e090bc9701879d596acd017ae846252a7b/68747470733a2f2f7777772e7465727261666f726d2e696f2f6173736574732f696d616765732f6c6f676f2d6861736869636f72702d33663130373332662e737667)

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. 

#Make sure terraform is working properly

Usage: terraform [--version] [--help] <command> [args]

The most common, useful commands are shown first, followed by
less common or more advanced commands.

 #Common commands:

`apply`  Builds or changes infrastructure

`console`  Interactive console for Terraform interpolations
...

# Types of resources are supported:

 -   VPC
 -   Subnet
 -   Internet Gateway
 -   Nat Gateway
 -   Route 53

  Terraform versions: 0.14
  
   **1. Create a VPC**

Create a VPC The really first stage for bootstrapping an AWS account    is to create a VPC    (https://www.terraform.io/docs/providers/aws/r/vpc.html)

  

    1. resource "aws_vpc" "main" {
    2. cidr_block = var.cidr_block
    3. tags = var.tags
    4. }

  
**2. Create public and private Subnets**

Then create public and private subnets in each AZs
(https://www.terraform.io/docs/providers/aws/r/subnet.html)

**For public subnets**

   resource "aws_subnet" "public1" {
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

resource "aws_route_table" "r" {
	vpc_id = aws_vpc.main.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.gw.id
	}
	tags = var.tags
}


resource "aws_route_table_association" "public1" {
	subnet_id = aws_subnet.public1.id
	route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "public2" {
	subnet_id = aws_subnet.public2.id
	route_table_id = aws_route_table.r.id
}
resource "aws_route_table_association" "public3" {
	subnet_id = aws_subnet.public3.id
	route_table_id = aws_route_table.r.id
}
    
**For private subnets**

**3. Create internet and nat Gateways**

(https://www.terraform.io/docs/providers/aws/r/internet_gateway.html)

    1.  resource "aws_internet_gateway" "gw" {
    2.  vpc_id = "${aws_vpc.main.id}"
    3.  tags = "${var.tags}"
    4.  }
    
    5.  resource "aws_nat_gateway" "gw" {
    6.  allocation_id = "${aws_eip.nat.id}"
    7.  subnet_id = "${aws_subnet.subnet1.id}"
    8.  tags = "${var.tags}"
    
    9.  }
    
    10.  resource "aws_eip" "nat" {
    11.  vpc  = true
    12.  tags = "${var.tags}"
    13.  }
    14. 

**4.Create security group**
(https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)

    15.  1.resource "aws_security_group" "vpc_task" {
    16.  name  = "vpc_task"
    17.  description = "Allow TLS inbound traffic"
    
    18.  ingress {
    19.  description = "Allow ssh"
    20.  from_port = 22
    21.  to_port = 22
    22.  protocol  = "tcp"
    23.  cidr_blocks = ["0.0.0.0/0"]
    24.  }

    25.  egress {
    26.  from_port = 0
    27.  to_port = 0
    28.  protocol  = "-1"
    29.  cidr_blocks = ["0.0.0.0/0"]
    30.  }
    
    31.  tags = "${var.tags}"
    32.  }
    33. 

**5.Create route tables and routes**

(https://www.terraform.io/docs/providers/aws/r/route_table.html)
(https://www.terraform.io/docs/providers/aws/r/route.html)
(https://www.terraform.io/docs/providers/aws/r/route_table_association.html)

    1.  resource "aws_route_table" "r" {
    2.  vpc_id = "${aws_vpc.main.id}"
    
    3.  route {
    4.  cidr_block = "0.0.0.0/0"
    5.  gateway_id = "${aws_internet_gateway.gw.id}"
    6.  }
    
    7.  tags = "${var.tags}"
    8.  }
    
    9.  resource "aws_route_table_association" "a" {
    10.  subnet_id  = "${aws_subnet.subnet101.id}"
    11.  route_table_id = "${aws_route_table.r.id}"
    12.  }
    
    13.  resource "aws_route_table_association" "b" {
    14.  subnet_id  = "${aws_subnet.subnet102.id}"
    15.  route_table_id = "${aws_route_table.r.id}"
    16.  }
    
    17.  resource "aws_route_table_association" "c" {
    18.  subnet_id  = "${aws_subnet.subnet103.id}"
    19.  route_table_id = "${aws_route_table.r.id}"
    20.  }

**![](https://lh3.googleusercontent.com/c2lSElpvxKLnwqtpAjtd7bG9dj6yE8lR4MVaarENzqANR40w5uJm9038cFYz9AM-9e09f1gOkNdFjEQ5xlqxfw4VwMYW0Wwc9GwQP9l5Kba9Cb_YoZ63_wxpPGWDleEaRmn_tZxBbx4)**

# vpc_project
team2
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzMTg1NTMyMTcsLTEzNDY0OTkwMjAsND
c4ODM4OTYxXX0=
-->