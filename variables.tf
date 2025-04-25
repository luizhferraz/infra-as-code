variable "environment" {
  description = "Nome do ambiente (qa/prod)"
  type        = string
}

variable "location" {
  description = "Região Azure (ex: eastus)"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Nome do resource group"
  type        = string
}

variable "vm_size" {
  description = "Tamanho da VM"
  type        = string
  default     = "Standard_B1s"
}