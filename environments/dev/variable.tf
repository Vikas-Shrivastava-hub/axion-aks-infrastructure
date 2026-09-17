variable "rg" {
  type = map(object({
    name     = string
    location = string
  }))
}
variable "vnet" {
  type = map(object({
    name          = string
    location      = optional(string)
    rg_name       = string
    address_space = list(string)
  }))
}
variable "subnet" {
  type = map(object({
    name             = string
    vnet_name        = string
    rg_name          = string
    address_prefixes = list(string)
    delegation = optional(object({
      name         = string
      service_name = string
      action       = optional(list(string))
    }))
    default_outbound_access_enabled = optional(bool)
    ip_address_pool = optional(object({
      id                     = string
      number_of_ip_addresses = number
    }))
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    sharing_scope                                 = optional(string)
    service_endpoints                             = optional(list(string))
    service_endpoint_policy_ids                   = optional(list(string))

  }))
}


variable "aks" {
  type = map(object({
    name        = string
    location    = optional(string)
    rg_name     = string
    vnet_name   = string
    subnet_name = string
    dns_prefix  = string
    default_node_pool = object({
      name                 = string
      node_count           = number
      vm_size              = string
      auto_scaling_enabled = optional(bool)
      max_count            = optional(number)
      min_count            = optional(number)
      os_disk_size_gb      = optional(number)
      os_disk_type         = optional(string)
      vnet_subnet_id       = optional(string)
    })
    network_profile = object({
      network_plugin      = string
      network_plugin_mode = optional(string)
      pod_cidr            = optional(string)
      service_cidr        = optional(string)
      dns_service_ip      = optional(string)
      network_policy      = optional(string)
      load_balancer_sku   = optional(string)
    })
  }))
}
