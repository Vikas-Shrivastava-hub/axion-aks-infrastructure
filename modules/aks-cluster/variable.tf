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
