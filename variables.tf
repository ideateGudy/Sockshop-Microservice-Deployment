variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "cluster_name" {
  description = "The name for the AKS cluster"
  default     = "aks-cluster"
}
variable "env_name" {
  description = "The environment for the AKS cluster"
  default     = "test-env"
}

variable "name_prefix" {
  description = "The prefix for the resources"
  default     = "random_pet.prefix.id"
  
}
variable "node_default_name" {
  description = "The default node pool name"
  default     = "default"
}
variable "node_count" {
  description = "The number of nodes in the default node pool"
  default     = 2
  
}

variable "vm_size" {
  description = "The size of the VMs in the default node pool"
  default     = "Standard_D2_v2"
  
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in the default node pool"
  default     = 30
  
}