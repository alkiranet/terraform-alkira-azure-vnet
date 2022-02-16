variable "resource_group" {
  description = "Azure resource group"
  type        = string
}

variable "enabled" {
  description = "Status of connector; Default is true"
  type        = bool
  default     = true
}

variable "custom_prefixes" {
  description = "Controls if custom prefixes are used for routing from cloud network to CXP; If values are provided, local var 'is_custom' changes to 'true'"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Name of cloud network and Alkira connector"
  type        = string
}

variable "cidr" {
  description = "Address space of cloud network"
  type        = string
}

variable "subnets" {
  description = "Subnets to create for cloud network"
  type        = list(map(string))
  default     = [{}]
}

variable "billing_tags" {
  description = "List of billing tag names to apply to connector"
  type        = list(string)
  default     = []
}

variable "credential" {
  description = "Alkira - cloud credential"
  type        = string
}

variable "segment" {
  description = "Alkira - segment to add connector to"
  type        = string
}

variable "group" {
  description = "Alkira - group to add connector to"
  type        = string
}

variable "cxp" {
  description = "Alkira - CXP to add connector to"
  type        = string
}

variable "size" {
  description = "Alkira - connector size"
  type        = string
  default     = "SMALL"
}
