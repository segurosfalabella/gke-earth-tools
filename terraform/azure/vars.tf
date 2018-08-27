variable "resource_group_main" {
  type = "string"
}

variable "cluster_name" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "ssh_key" {
  type = "string"
}

variable "vnet_main" {
  type = "string"
}

variable "subnet_main" {
  type = "map"
}

variable "node_count" {
  type = "string"
}

variable "consul_base_path" {
  type = "string"
}

variable "consul_addr" {
  type = "string"
}

variable "consul_token" {
  type = "string"
}

variable "client_id" {
  type = "string"
}

variable "client_secret" {
  type = "string"
}
