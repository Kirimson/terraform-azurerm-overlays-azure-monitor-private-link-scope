# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.


###########################
# Global Configuration   ##
###########################

variable "location" {
  description = "Azure region in which instance will be hosted"
  type        = string
}

variable "environment" {
  description = "The Terraform backend environment e.g. public or usgovernment"
  type        = string
}

variable "deploy_environment" {
  description = "Name of the workload's environment"
  type        = string
}

variable "workload_name" {
  description = "Name of the workload_name"
  type        = string
  default = "ampls"
}

variable "org_name" {
  description = "Name of the organization"
  type        = string
}

#######################
# RG Configuration   ##
#######################

variable "create_resource_group" {
  description = "Controls if the resource group should be created. If set to false, the resource group name must be provided. Default is false."
  type        = bool
  default     = false
}

variable "use_location_short_name" {
  description = "Use short location name for resources naming (ie eastus -> eus). Default is true. If set to false, the full cli location name will be used. if custom naming is set, this variable will be ignored."
  type        = bool
  default     = true
}

variable "existing_resource_group_name" {
  description = "The name of the existing resource group to use. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables."
  type        = string
  default     = null
}

#####################################
# Private Endpoint Configuration   ##
#####################################

variable "existing_ampls_private_subnet_name" {
  description = "(Required) Name of the existing subnet for ampls"
  default = null
}

variable "existing_ampls_virtual_network_name" {
  description = "(Required) Name of the virtual network for ampls"
  default = null
}

variable "existing_ampls_network_resource_group_name" {
  description = "(Required) Name of the resource group for ampls network"
  default = null
}

variable "linked_log_analytic_workspace_ids" {
  type        = list(string)
  default     = [""]
  description = "(Required) The id of the log analytic workspace to link to the private link service"
}

variable "azurerm_monitor_private_link_scope_id" {
  type        = string
  default     = null
  description = "The id of the private link scope to link to the private link service, if not set, a new private link scope will be created"
}
