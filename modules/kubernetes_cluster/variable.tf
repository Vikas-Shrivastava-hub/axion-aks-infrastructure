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
