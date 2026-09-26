module "rg" {
    source = "../../modules/resource-group"
    rg = var.rg

}
module "vnet" {
    depends_on = [ module.rg ]
    source = "../../modules/virtual-network"
    vnet = var.vnet
}
module "subnet" {
    depends_on = [ module.vnet ]
    source = "../../modules/subnet"
    subnet = var.subnet
}
module "aks" {
    depends_on = [ module.subnet ]
    source = "../../modules/aks-cluster"
    aks_cluster = var.aks_cluster
}