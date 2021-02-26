---


---

<p><img src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" alt="Terraform"></p>
<p>Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.</p>
<ul>
<li>Website:  [<a href="https://www.terraform.io">https://www.terraform.io</a>]</li>
</ul>
<p>Terraform module which creates VPC resources on AWS.</p>
<p>These types of resources are supported:</p>
<ul>
<li>
<p><a href="https://www.terraform.io/docs/providers/aws/r/vpc.html">VPC</a></p>
</li>
<li>
<p><a href="https://www.terraform.io/docs/providers/aws/r/subnet.html">Subnet</a></p>
</li>
<li>
<p><a href="https://www.terraform.io/docs/providers/aws/r/route.html">Route</a></p>
</li>
<li>
<p><a href="https://www.terraform.io/docs/providers/aws/r/route_table.html">Route table</a></p>
</li>
<li>
<p><a href="https://www.terraform.io/docs/providers/aws/r/internet_gateway.html">Internet Gateway</a></p>
</li>
<li>
<p><a href="https://www.terraform.io/docs/providers/aws/r/nat_gateway.html">NAT Gateway</a></p>
</li>
</ul>
<p><em>Terraform version: 0.14</em></p>
<h2 id="terraform-aws-vpc">terraform-aws-vpc</h2>
<pre><code>module "vpc-project" {
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
</code></pre>
<hr>
<h3 id="get-the-output">Get the output</h3>
<pre><code>output "vpc_id" {
    value = module.vpc-project.vpc
}
output "public" {
    value = module.vpc-project.public_subnets
}
output "private" {
    value = module.vpc-project.private_subnets
}
output "region" {
    value = module.vpc-project.region
}
</code></pre>
<p><strong><img src="https://lh3.googleusercontent.com/c2lSElpvxKLnwqtpAjtd7bG9dj6yE8lR4MVaarENzqANR40w5uJm9038cFYz9AM-9e09f1gOkNdFjEQ5xlqxfw4VwMYW0Wwc9GwQP9l5Kba9Cb_YoZ63_wxpPGWDleEaRmn_tZxBbx4" alt=""></strong></p>

