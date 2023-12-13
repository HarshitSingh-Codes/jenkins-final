/*---------------network module variables---------------*/

jenkins_vpc_cidr                 = "10.0.0.0/16"
jenkins_vpc_enable_dns_hostnames = true
jenkins_vpc_enable_dns_support   = true
jenkins_vpc_name                 = "jenkins-vpc-01"

/*---------------subnet variables---------------*/

/*--------------- Public Subnets ---------------*/

jenkins_public_subnets_az   = ["us-west-2a", "us-west-2b"]
jenkins_public_subnets_cidr = ["10.0.2.0/24", "10.0.4.0/24"]
jenkins_public_subnets_tags = [{
  "Name" = "jenkins-pub-sub-01"
  }, {
  "Name" = "jenkins-pub-sub-02"
}]
jenkins_enable_map_public_ip_on_launch = true

/*--------------- Private Subnets ---------------*/

jenkins_private_subnets_az   = ["us-west-2a", "us-west-2b"]
jenkins_private_subnets_cidr = ["10.0.6.0/24", "10.0.8.0/24"]
jenkins_private_subnets_tags = [{
  "Name" = "jenkins-priv-sub-01"
  }, {
  "Name" = "jenkins-priv-sub-02"
}]
/*--------------- # Internet Gateway ---------------*/

jenkins_igw_name = "jenkins-igw-01"

/*--------------- # NAT Gateway ---------------*/

jenkins_nat_name = "jenkins-nat-01"

/*--------------- Public RTB ---------------*/

jenkins_pub_route_table_name = "jenkins-route-pub-01"

/*--------------- Private RTB ---------------*/

jenkins_pri_route_table_name = "jenkins-route-priv-01"

/*---------------\/\/ Security Module \/\/---------------*/
