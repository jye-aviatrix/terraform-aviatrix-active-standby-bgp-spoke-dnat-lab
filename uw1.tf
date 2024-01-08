module "uw1transit" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.5.1"
  cloud   = "AWS"
  region  = "us-west-1"
  cidr    = "10.16.0.0/23"
  account = "aws-lab-jye"
  name    = "uw1transit"
  gw_name = "uw1transit"
  ha_gw = true
  insane_mode = true
  local_as_number = 65016
}

module "uw1spoke1" {
  source   = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version  = "1.6.7"
  cloud    = "AWS"
  region   = "us-west-1"
  cidr     = "10.16.100.0/24"
  account  = "aws-lab-jye"
  name     = "uw1spoke1"
  gw_name  = "uw1spoke1"
  attached = true
  transit_gw = module.uw1transit.transit_gateway.gw_name
  ha_gw = true
  insane_mode = true
  enable_max_performance = true
}

module "uw1landing1" {
  source   = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version  = "1.6.7"
  cloud    = "AWS"
  region   = "us-west-1"
  cidr     = "10.16.101.0/24"
  account  = "aws-lab-jye"
  name     = "uw1landing1"
  gw_name  = "uw1landing1"
  attached = true
  transit_gw = module.uw1transit.transit_gateway.gw_name
  ha_gw = true
  insane_mode = true
  enable_max_performance = true
  enable_bgp = true
  local_as_number = 65101
  enable_active_standby = true  # Enable Active/Standy external connection on BGP active mesh 2.0 spoke
  enable_active_standby_preemptive = true
  bgp_hold_time = 60
  bgp_polling_time = 20
}

# module "uw1landing2" {
#   source   = "terraform-aviatrix-modules/mc-spoke/aviatrix"
#   version  = "1.6.5"
#   cloud    = "AWS"
#   region   = "us-west-1"
#   cidr     = "10.16.102.0/24"
#   account  = "aws-lab-jye"
#   name     = "uw1landing2"
#   gw_name  = "uw1landing2"
#   attached = true
#   transit_gw = module.uw1transit.transit_gateway.gw_name
#   ha_gw = false
#   insane_mode = true
#   enable_max_performance = true
#   enable_bgp = true
#   local_as_number = 65102
#   # enable_active_standby = false  # Enable Active/Standy external connection on BGP active mesh 2.0 spoke
#   bgp_hold_time = 60
#   bgp_polling_time = 20
# }






module "uw1pub1" {
  source  = "jye-aviatrix/aws-linux-vm-public/aws"
  version = "2.0.4"
  key_name = "ec2-key-pair"
  vm_name = "uw1pub1"
  subnet_id = module.uw1spoke1.vpc.public_subnets[0].subnet_id
  vpc_id = module.uw1spoke1.vpc.vpc_id
  use_eip = true
  providers = {
    aws = aws.uw1
  }
}

output "uw1pub1" {
  value = module.uw1pub1
}
