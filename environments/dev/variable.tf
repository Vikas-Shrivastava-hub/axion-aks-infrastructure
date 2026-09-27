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
    service_endpoint = optional(object({
      service            = string
      network_identifier = optional(string)
    }))
    service_endpoint_policy_ids = optional(list(string))

  }))
}

variable "aks_cluster" {
  type = map(object({
    name        = string
    location    = optional(string)
    rg_name     = string
    subnet_name = string
    vnet_name   = string
    dns_prefix  = string
    default_node_pool = object({
      name                 = string
      node_count           = optional(number)
      vm_size              = optional(string)
      vnet_subnet_id       = optional(string)
      os_disk_size_gb      = optional(number)
      os_disk_type         = optional(string)
      auto_scaling_enabled = optional(bool)
      min_count            = optional(number)
      max_count            = optional(number)
      max_pods             = optional(number)
      zones                = optional(list(string))
    })
    identity = object({
      type         = string
      identity_ids = optional(list(string))
    })
    network_profile = object({
      network_plugin      = string
      network_plugin_mode = optional(string)
      pod_cidr            = optional(string)
      service_cidr        = optional(string)
      dns_service_ip      = optional(string)
      network_policy      = optional(string)
      load_balancer_sku   = optional(string)
      outbound_type       = optional(string)
    })
    node_provisioning_profile = optional(object({
      default_node_pools = optional(string)
    }))
  }))
}
