rg = {
  rg1 = {
    name     = "aks-rg"
    location = "centralindia"
  }
}
vnet = {
  vnet1 = {
    name          = "aks-vnet"
    rg_name       = "aks-rg"
    address_space = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name             = "aks-subnet"
    vnet_name        = "aks-vnet"
    rg_name          = "aks-rg"
    address_prefixes = ["10.0.1.0/24"]
  }
}

aks = {
  aks1 = {
    name        = "vikas-cluster"
    rg_name     = "aks-rg"
    dns_prefix  = "vikascluster"
    vnet_name   = "aks-vnet"
    subnet_name = "aks-subnet"
    default_node_pool = {
      name           = "default"
      node_count     = 1
      vm_size        = "Standard_D2ads_v6"
      vnet_subnet_id = "abs"
    }
    network_profile = {
      network_plugin      = "azure"
      network_plugin_mode = "overlay"
      service_cidr        = "172.16.0.0/16"
      dns_service_ip      = "172.16.0.10"
      network_policy      = "calico"
    }
  }
}
