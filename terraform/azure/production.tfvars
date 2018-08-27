resource_group_main = "[YOUR_PRODUCTION_RESOURCE_GROUP]"

cluster_name = "[CLUSTER_NAME]"

environment = "production"

ssh_key = "[YOUR_SSH_KEY]"

vnet_main = "[YOUR_VNET_NAME]"

subnet_main = {
  name   = "[YOUR_SUBNET_NAME]"
  prefix = "10.40.0.0/26"
}

node_count = 3
