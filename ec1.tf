module "ec1transit" {
  source                = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version               = "2.5.1"
  cloud                 = "AWS"
  region                = "eu-central-1"
  cidr                  = "10.32.0.0/23"
  account               = "aws-lab-jye"
  name                  = "ec1transit"
  gw_name               = "ec1transit"
  ha_gw                 = true
  insane_mode           = true
  local_as_number       = 65032
  enable_active_standby = false # Enable Active/Standy external connection on BGP active mesh 2.0 spoke
  bgp_hold_time         = 60
  bgp_polling_time      = 20
}

module "ec1spoke1" {
  source                 = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version                = "1.6.7"
  cloud                  = "AWS"
  region                 = "eu-central-1"
  cidr                   = "10.32.100.0/24"
  account                = "aws-lab-jye"
  name                   = "ec1spoke1"
  gw_name                = "ec1spoke1"
  attached               = true
  insane_mode            = true
  transit_gw             = module.ec1transit.transit_gateway.gw_name
  ha_gw                  = true
  enable_max_performance = true
}

module "ec1pub1" {
  source    = "jye-aviatrix/aws-linux-vm-public/aws"
  version   = "2.0.4"
  key_name  = "ec2-key-pair"
  vm_name   = "ec1pub1"
  subnet_id = module.ec1spoke1.vpc.public_subnets[0].subnet_id
  vpc_id    = module.ec1spoke1.vpc.vpc_id
  use_eip   = true
  providers = {
    aws = aws.ec1
  }
}

output "ec1pub1" {
  value = module.ec1pub1
}
