resource "azurerm_kubernetes_cluster" "aks_cluster" {
  for_each            = var.aks_cluster
  name                = each.value.name
  location            = data.azurerm_resource_group.rg[each.key].location
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
  dns_prefix          = each.value.dns_prefix
  default_node_pool {
    name                 = each.value.default_node_pool.name
    node_count           = lookup(each.value.default_node_pool, "node_count", null)
    vm_size              = lookup(each.value.default_node_pool, "vm_size", null)
    vnet_subnet_id       = each.value.default_node_pool.vnet_subnet_id != null ? data.azurerm_subnet.subnet[each.key].id : null
    os_disk_size_gb      = lookup(each.value.default_node_pool, "os_disk_size_gb", null)
    os_disk_type         = lookup(each.value.default_node_pool, "os_disk_type", null)
    auto_scaling_enabled = lookup(each.value.default_node_pool, "auto_scaling_enabled", null)
    min_count            = lookup(each.value.default_node_pool, "min_count", null)
    max_count            = lookup(each.value.default_node_pool, "max_count", null)
    max_pods             = lookup(each.value.default_node_pool, "max_pods", null)
    zones                = lookup(each.value.default_node_pool, "zones", null)

  }
  identity {
    type         = each.value.identity.type
    identity_ids = lookup(each.value.identity, "identity_ids", null)
  }
  network_profile {
    network_plugin      = each.value.network_profile.network_plugin
    network_plugin_mode = lookup(each.value.network_profile, "network_plugin_mode", null)
    pod_cidr            = lookup(each.value.network_profile, "pod_cidr", null)
    service_cidr        = lookup(each.value.network_profile, "service_cidr", null)
    dns_service_ip      = lookup(each.value.network_profile, "dns_service_ip", null)
    network_policy      = lookup(each.value.network_profile, "network_policy", null)
    load_balancer_sku   = lookup(each.value.network_profile, "load_balancer_sku", null)
    outbound_type       = lookup(each.value.network_profile, "outbound_type", null)
  }
  node_provisioning_profile {
    default_node_pools = lookup(each.value.node_provisioning_profile, "default_node_pools", null)
  }

}
