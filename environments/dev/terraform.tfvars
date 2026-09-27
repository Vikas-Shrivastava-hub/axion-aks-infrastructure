rg = {
  rg1 = {
    name     = "rg-axion-dev"
    location = "centralindia"
  }
}
vnet = {
  vnet1 = {
    name          = "vnet-axion-dev"
    rg_name       = "rg-axion-dev"
    address_space = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name             = "snet-axion-aks-dev"
    vnet_name        = "vnet-axion-dev"
    rg_name          = "rg-axion-dev"
    address_prefixes = ["10.0.1.0/24"]
  }
}
aks_cluster = {
  aks1 = {
    name        = "aks-axion-dev"
    rg_name     = "rg-axion-dev"
    subnet_name = "snet-axion-aks-dev"
    vnet_name   = "vnet-axion-dev"
    dns_prefix  = "axion-dns-dev"
    default_node_pool = {
      name           = "default"
      node_count     = 1
      vm_size        = "Standard_D2als_v6"
      vnet_subnet_id = "data"

    }
    identity = {
      type = "SystemAssigned"

    }
    network_profile = {
      network_plugin      = "azure"
      network_plugin_mode = "overlay"
      service_cidr        = "172.16.0.0/16"
      dns_service_ip      = "172.16.0.10"
      network_policy      = "calico"
    }
    node_provisioning_profile = {
      default_node_pools = "Auto"
    }
  }
}
