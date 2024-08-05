variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The location of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "env_name" {
  description = "Environment name"
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
  description = "Number of nodes"
  type        = number
}

variable "vm_size" {
  description = "VM size"
  type        = string
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
