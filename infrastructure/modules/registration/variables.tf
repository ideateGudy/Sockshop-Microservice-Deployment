variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "execute_on_create" {
  description = "Whether to execute the AKS credentials command (only on create)"
  type        = bool
  default     = false
}