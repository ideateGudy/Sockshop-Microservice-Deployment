variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "node_default_name" {
  description = "Default node pool name"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
}

variable "vm_size" {
  description = "The size of the VMs in the default node pool"
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in the default node pool"
}

variable "app_id" {
  description = "Service principal app ID"
  type        = string
}

variable "password" {
  description = "Service principal password"
  type        = string
}
