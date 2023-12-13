provider "aws" {
  region = "us-west-2"
}
terraform {
  backend "s3" {
    bucket = "tool-setup-bucket-terraform-state"
    key = "jenkins-State-File/terraform.tfstate"
    region = "us-west-2"
  }
}
module "network_module" {
  source = "./modules/network"

  /*--------------- VPC ---------------*/

  vpc_cidr                 = var.jenkins_vpc_cidr
  vpc_name                 = var.jenkins_vpc_name
  vpc_enable_dns_hostnames = var.jenkins_vpc_enable_dns_hostnames
  vpc_enable_dns_support   = var.jenkins_vpc_enable_dns_support

  /*--------------- Public Subnets ---------------*/

  public_subnets_cidr = var.jenkins_public_subnets_cidr
  public_subnets_az   = var.jenkins_public_subnets_az
  public_subnets_tags = var.jenkins_public_subnets_tags

  /*--------------- Private Subnets ---------------*/

  private_subnets_cidr = var.jenkins_private_subnets_cidr
  private_subnets_az   = var.jenkins_private_subnets_az
  private_subnets_tags = var.jenkins_private_subnets_tags

  /*--------------- # Internet Gateway ---------------*/
  igw_name = var.jenkins_igw_name

  /*--------------- NAT Gateway ---------------*/

  nat_name = var.jenkins_nat_name

  /*--------------- Public RTB ---------------*/

  pub_route_table_name = var.jenkins_pub_route_table_name

  /*--------------- Private RTB ---------------*/

  pri_route_table_name = var.jenkins_pri_route_table_name

}
# module "jenkins_iam" {
#   source = "./modules/iam"
#   instance_profile_name = "jenkins-instance-profile"
#   iam_policy_name       = "jenkins-iam-policy"
#   role_name             = "jenkins-role"
# }

# module "efs_module" {
#   source = "./modules/efs"
#   vpc_id     = "vpc-060a50f71d3e22b4e"
#   subnet_ids = ["subnet-0a8741dccc388f1f6", "subnet-046aa42021a58f060", "subnet-0ed70b5997e539ec0"]
# }

# module "lb-asg" {
#   source        = "./modules/lb-asg"
#   subnets       = ["subnet-058a7514ba8adbb07", "subnet-0dbcd1ac168414927", "subnet-032f5077729435858"]
#   ami_id        = "ami-074d40b56472c5b9b"
#   instance_type = "t2.micro"
#   key_name      = "techiescamp"
#   environment   = "dev"
#   vpc_id        = "vpc-0a5ca4a92c2e10163"
# }