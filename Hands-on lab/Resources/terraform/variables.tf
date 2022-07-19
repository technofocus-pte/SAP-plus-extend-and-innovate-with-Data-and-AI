variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "mcw_sap_plus_extend_and_innovate"
}

variable "location" {
  description = "Location to deploy resources"
  type        = string
  default     = "eastus"
}


variable "SID" {
  description = "The SAP SID name"
  type        = string
  default     = "S4D"
}

variable "vmsize" {
  description = "Size of the VMs"
  default     = "Standard_B2s"
}
