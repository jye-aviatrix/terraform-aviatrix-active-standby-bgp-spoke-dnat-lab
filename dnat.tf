# # Add policy for destination NAT function for an Aviatrix AWS Spoke Gateway
resource "aviatrix_gateway_dnat" "dnat_33" {
  gw_name   = module.uw1landing1.spoke_gateway.gw_name
  dnat_policy {
    src_cidr    = module.ec1spoke1.vpc.cidr
    dst_cidr    = "33.33.33.33/32"
    dnat_ips    = module.uw1pub1.private_ip
    protocol = "all"
    connection = "${aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit-prim.connection_name}@site2cloud"
    apply_route_entry = false
  }
}

resource "aviatrix_gateway_dnat" "dnat_33_ha" {
  gw_name   = module.uw1landing1.spoke_gateway.ha_gw_name
  dnat_policy {
    src_cidr    = module.ec1spoke1.vpc.cidr
    dst_cidr    = "33.33.33.33/32"
    dnat_ips    = module.uw1pub1.private_ip
    protocol = "all"
    connection = "${aviatrix_spoke_external_device_conn.uw1landing1-to-ec1transit-ha.connection_name}@site2cloud"
    apply_route_entry = false
  }
}




# resource "aviatrix_gateway_dnat" "gateway_dnat_1" {
#     gw_name = "uw1landing"
#     dnat_policy {
#         src_cidr = "10.32.100.0/24"
#         dst_cidr = "33.33.33.33/32"
#         protocol = "all"
#         interface = "eth0"
#         connection = "None"
#         dnat_ips = "10.32.100.37"
#         apply_route_entry = false
#     }

# }

# resource "aviatrix_gateway_dnat" "dnat_hagw_33" {
#   gw_name   = module.uw1landing.spoke_gateway.ha_gw_name
#   dnat_policy {
#     src_cidr    = module.ec1spoke1.vpc.cidr
#     dst_cidr    = "33.33.33.33/32"
#     dnat_ips    = module.uw1pub1.private_ip
#   }
# }