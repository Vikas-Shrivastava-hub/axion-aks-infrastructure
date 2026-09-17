module "rg" {
  source = "../../modules/resource_group"
  rg     = var.rg
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/virtual_network"
  vnet       = var.vnet
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/subnet"
  subnet     = var.subnet
}

module "aks" {
  depends_on = [module.subnet]
  source     = "../../modules/kubernetes_cluster"
  aks        = var.aks
}
