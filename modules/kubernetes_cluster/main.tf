resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks
  name                = each.value.name
  location            = data.azurerm_resource_group.rg[each.key].location
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
  dns_prefix          = each.value.dns_prefix
  default_node_pool {
    name                 = each.value.default_node_pool.name
    node_count           = each.value.default_node_pool.node_count
    vm_size              = each.value.default_node_pool.vm_size
    auto_scaling_enabled = lookup(each.value.default_node_pool, "auto_scaling_enabled", null)
    max_count            = (lookup(each.value.default_node_pool, "max_count", null))
    min_count            = (lookup(each.value.default_node_pool, "min_count", null))
    os_disk_size_gb      = lookup(each.value.default_node_pool, "os_disk_size_gb", null)
    os_disk_type         = lookup(each.value.default_node_pool, "os_disk_type", null)
    vnet_subnet_id       = each.value.default_node_pool.vnet_subnet_id != null ? data.azurerm_subnet.subnet[each.key].id : null
    
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin = each.value.network_profile.network_plugin
    network_plugin_mode = lookup(each.value.network_profile, "network_plugin_mode", null)
    pod_cidr = lookup(each.value.network_profile, "pod_cidr", null)
    service_cidr = lookup(each.value.network_profile, "service_cidr", null)
    dns_service_ip = lookup(each.value.network_profile, "dns_service_ip", null)
    network_policy = lookup(each.value.network_profile, "network_policy", null)
    load_balancer_sku = lookup(each.value.network_profile, "load_balancer_sku", null)
  }
  node_provisioning_profile {
    default_node_pools = "Auto"
  }

}
