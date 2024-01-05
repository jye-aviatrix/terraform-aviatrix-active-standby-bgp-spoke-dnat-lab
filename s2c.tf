resource "random_string" "pre_shared_key" {
  length           = 16
  special          = false
}

# # ----- HA Spoke to both Transit S2C
# resource "aviatrix_spoke_external_device_conn" "uw1landing1-to-ec1transit" {
#   vpc_id            = module.uw1landing1.vpc.vpc_id
#   connection_name   = "uw1landing1-to-ec1transit"
#   gw_name           = module.uw1landing1.spoke_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.uw1landing1.spoke_gateway.local_as_number
#   bgp_remote_as_num = module.ec1transit.transit_gateway.local_as_number
#   remote_gateway_ip = "${module.ec1transit.transit_gateway.public_ip},${module.ec1transit.transit_gateway.ha_public_ip}"
#   pre_shared_key = random_string.pre_shared_key.result
#   manual_bgp_advertised_cidrs = ["33.33.33.33/32"]
#   ha_enabled = false
# }


# resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing1-prim" {
#   vpc_id            = module.ec1transit.vpc.vpc_id
#   connection_name   = "ec1transit-to-uw1landing1-prim"
#   gw_name           = module.ec1transit.transit_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
#   bgp_remote_as_num = module.uw1landing1.spoke_gateway.local_as_number
#   remote_gateway_ip = module.uw1landing1.spoke_gateway.public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   local_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit.remote_tunnel_cidr)[0]},169.254.100.1/30"
#   remote_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit.local_tunnel_cidr)[0]},169.254.100.2/30"
#   ha_enabled = false
# }

# resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing1-ha" {
#   vpc_id            = module.ec1transit.vpc.vpc_id
#   connection_name   = "ec1transit-to-uw1landing-ha"
#   gw_name           = module.ec1transit.transit_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
#   bgp_remote_as_num = module.uw1landing1.spoke_gateway.local_as_number
#   remote_gateway_ip = module.uw1landing1.spoke_gateway.ha_public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   local_tunnel_cidr = "169.254.100.5/30,${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit.remote_tunnel_cidr)[1]}"
#   remote_tunnel_cidr = "169.254.100.6/30,${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit.local_tunnel_cidr)[1]}"
#   ha_enabled = false
#   prepend_as_path = [module.ec1transit.transit_gateway.local_as_number,module.ec1transit.transit_gateway.local_as_number,module.ec1transit.transit_gateway.local_as_number]
# }



# ----- HA Spoke to primary Transit S2C
# resource "aviatrix_spoke_external_device_conn" "uw1landing-to-ec1transit" {
#   vpc_id            = module.uw1landing.vpc.vpc_id
#   connection_name   = "uw1landing-to-ec1transit"
#   gw_name           = module.uw1landing.spoke_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.uw1landing.spoke_gateway.local_as_number
#   bgp_remote_as_num = module.ec1transit.transit_gateway.local_as_number
#   remote_gateway_ip = module.ec1transit.transit_gateway.public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   manual_bgp_advertised_cidrs = ["33.33.33.33/32"]
#   ha_enabled = false
# }


# resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing1" {
#   vpc_id            = module.ec1transit.vpc.vpc_id
#   connection_name   = "ec1transit-to-uw1landing1"
#   gw_name           = module.ec1transit.transit_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
#   bgp_remote_as_num = module.uw1landing.spoke_gateway.local_as_number
#   remote_gateway_ip = module.uw1landing.spoke_gateway.public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   local_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing-to-ec1transit.remote_tunnel_cidr)[0]},169.254.100.1/30"
#   remote_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing-to-ec1transit.local_tunnel_cidr)[0]},169.254.100.2/30"
#   ha_enabled = false
# }

# resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing2" {
#   vpc_id            = module.ec1transit.vpc.vpc_id
#   connection_name   = "ec1transit-to-uw1landing2"
#   gw_name           = module.ec1transit.transit_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
#   bgp_remote_as_num = module.uw1landing.spoke_gateway.local_as_number
#   remote_gateway_ip = module.uw1landing.spoke_gateway.ha_public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   local_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing-to-ec1transit.remote_tunnel_cidr)[1]},169.254.100.5/30"
#   remote_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing-to-ec1transit.local_tunnel_cidr)[1]},169.254.100.6/30"
#   ha_enabled = false
# }


# ----- two single primary spoke to both Transit S2C
# resource "aviatrix_spoke_external_device_conn" "uw1landing1-to-ec1transit" {
#   vpc_id            = module.uw1landing1.vpc.vpc_id
#   connection_name   = "uw1landing1-to-ec1transit"
#   gw_name           = module.uw1landing1.spoke_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.uw1landing1.spoke_gateway.local_as_number
#   bgp_remote_as_num = module.ec1transit.transit_gateway.local_as_number
#   remote_gateway_ip = module.ec1transit.transit_gateway.public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   manual_bgp_advertised_cidrs = ["33.33.33.33/32"]
#   ha_enabled = false
# }

# resource "aviatrix_spoke_external_device_conn" "uw1landing2-to-ec1transit" {
#   vpc_id            = module.uw1landing2.vpc.vpc_id
#   connection_name   = "uw1landing2-to-ec1transit"
#   gw_name           = module.uw1landing2.spoke_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.uw1landing2.spoke_gateway.local_as_number
#   bgp_remote_as_num = module.ec1transit.transit_gateway.local_as_number
#   remote_gateway_ip = module.ec1transit.transit_gateway.ha_public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   manual_bgp_advertised_cidrs = ["33.33.33.33/32"]
#   ha_enabled = false
#   prepend_as_path = [module.uw1landing2.spoke_gateway.local_as_number,
#                     module.uw1landing2.spoke_gateway.local_as_number,
#                     module.uw1landing2.spoke_gateway.local_as_number]
# }


# resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing1" {
#   vpc_id            = module.ec1transit.vpc.vpc_id
#   connection_name   = "ec1transit-to-uw1landing1"
#   gw_name           = module.ec1transit.transit_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
#   bgp_remote_as_num = module.uw1landing1.spoke_gateway.local_as_number
#   remote_gateway_ip = module.uw1landing1.spoke_gateway.public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   local_tunnel_cidr = "${aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit.remote_tunnel_cidr},169.254.100.1/30"
#   remote_tunnel_cidr = "${aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit.local_tunnel_cidr},169.254.100.2/30"
#   ha_enabled = false
# }

# resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing2" {
#   vpc_id            = module.ec1transit.vpc.vpc_id
#   connection_name   = "ec1transit-to-uw1landing2"
#   gw_name           = module.ec1transit.transit_gateway.gw_name
#   connection_type   = "bgp"
#   bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
#   bgp_remote_as_num = module.uw1landing2.spoke_gateway.local_as_number
#   remote_gateway_ip = module.uw1landing2.spoke_gateway.public_ip
#   pre_shared_key = random_string.pre_shared_key.result
#   local_tunnel_cidr = "169.254.100.5/30,${aviatrix_spoke_external_device_conn.uw1landing2-to-ec1transit.remote_tunnel_cidr}"
#   remote_tunnel_cidr = "169.254.100.6/30,${aviatrix_spoke_external_device_conn.uw1landing2-to-ec1transit.local_tunnel_cidr}"
#   ha_enabled = false
#   prepend_as_path = [module.ec1transit.transit_gateway.local_as_number,
#                     module.ec1transit.transit_gateway.local_as_number,
#                     module.ec1transit.transit_gateway.local_as_number]
# }


# HA Spoke 2 external connections to EC1 transit
resource "aviatrix_spoke_external_device_conn" "uw1landing1-to-ec1transit-prim" {
  vpc_id            = module.uw1landing1.vpc.vpc_id
  connection_name   = "uw1landing1-to-ec1transit-prim"
  gw_name           = module.uw1landing1.spoke_gateway.gw_name
  connection_type   = "bgp"
  bgp_local_as_num  = module.uw1landing1.spoke_gateway.local_as_number
  bgp_remote_as_num = module.ec1transit.transit_gateway.local_as_number
  remote_gateway_ip = module.ec1transit.transit_gateway.public_ip
  pre_shared_key = random_string.pre_shared_key.result
  manual_bgp_advertised_cidrs = ["33.33.33.33/32"]
  ha_enabled = false
}

resource "aviatrix_spoke_external_device_conn" "uw1landing1-to-ec1transit-ha" {
  vpc_id            = module.uw1landing1.vpc.vpc_id
  connection_name   = "uw1landing1-to-ec1transit-ha"
  gw_name           = module.uw1landing1.spoke_gateway.gw_name
  connection_type   = "bgp"
  bgp_local_as_num  = module.uw1landing1.spoke_gateway.local_as_number
  bgp_remote_as_num = module.ec1transit.transit_gateway.local_as_number
  remote_gateway_ip = module.ec1transit.transit_gateway.ha_public_ip
  pre_shared_key = random_string.pre_shared_key.result
  manual_bgp_advertised_cidrs = ["33.33.33.33/32"]
  ha_enabled = false
  prepend_as_path = [module.uw1landing1.spoke_gateway.local_as_number,module.uw1landing1.spoke_gateway.local_as_number,module.uw1landing1.spoke_gateway.local_as_number]
}


resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing1-prim" {
  vpc_id            = module.ec1transit.vpc.vpc_id
  connection_name   = "ec1transit-to-uw1landing1-prim"
  gw_name           = module.ec1transit.transit_gateway.gw_name
  connection_type   = "bgp"
  bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
  bgp_remote_as_num = module.uw1landing1.spoke_gateway.local_as_number
  remote_gateway_ip = module.uw1landing1.spoke_gateway.public_ip
  pre_shared_key = random_string.pre_shared_key.result
  local_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit-prim.remote_tunnel_cidr)[0]},169.254.100.1/30"
  remote_tunnel_cidr = "${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit-prim.local_tunnel_cidr)[0]},169.254.100.2/30"
  ha_enabled = false
}

resource "aviatrix_transit_external_device_conn" "ec1transit-to-uw1landing1-ha" {
  vpc_id            = module.ec1transit.vpc.vpc_id
  connection_name   = "ec1transit-to-uw1landing1-ha"
  gw_name           = module.ec1transit.transit_gateway.gw_name
  connection_type   = "bgp"
  bgp_local_as_num  = module.ec1transit.transit_gateway.local_as_number
  bgp_remote_as_num = module.uw1landing1.spoke_gateway.local_as_number
  remote_gateway_ip = module.uw1landing1.spoke_gateway.ha_public_ip
  pre_shared_key = random_string.pre_shared_key.result
  local_tunnel_cidr = "169.254.100.5/30,${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit-ha.remote_tunnel_cidr)[1]}"
  remote_tunnel_cidr = "169.254.100.6/30,${split(",",aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit-ha.local_tunnel_cidr)[1]}"
  ha_enabled = false
#   prepend_as_path = [module.ec1transit.transit_gateway.local_as_number,module.ec1transit.transit_gateway.local_as_number,module.ec1transit.transit_gateway.local_as_number]
    # Prepend may not be necessory, appears that our spoke take care of it using Active/Standby flag.
}