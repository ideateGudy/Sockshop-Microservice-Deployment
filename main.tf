# resource "random_pet" "prefix" {}

module "resource_group_module" {
  source   = "./modules/resource_group"
  name_prefix = var.name_prefix
  location    = var.location
  env_name    = var.env_name
}

module "network_module" {
  source              = "./modules/networking"
  name_prefix         = var.name_prefix
  location            = module.resource_group_module.location
  resource_group_name = module.resource_group_module.name
  env_name            = var.env_name
  depends_on = [ module.resource_group_module ]
}

module "aks_module" {
  source              = "./modules/aks"
  name_prefix         = var.name_prefix
  cluster_name        = var.cluster_name
  location            = module.resource_group_module.location
  resource_group_name = module.resource_group_module.name
  env_name            = var.env_name
  kubernetes_version  = var.kubernetes_version
  node_default_name   = var.node_default_name
  node_count          = var.node_count
  os_disk_size_gb = var.os_disk_size_gb
  vm_size             = var.vm_size
  app_id              = var.app_id
  password            = var.password
  depends_on = [ module.network_module, module.resource_group_module ]
}

module "post_apply" {
  source = "./modules/registration"
  resource_group_name = module.resource_group_module.name
  cluster_name = module.aks_module.cluster_name
  depends_on = [ module.aks_module ]
}



