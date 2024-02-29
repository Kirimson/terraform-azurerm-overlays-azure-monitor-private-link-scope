# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_ampls" {
  #source  = "azurenoops/overlays-azure-monitor-private-link-scope/azurerm"
  #version = "x.x.x"
  source = "../../.."

  # Resource Group, location, VNet and Subnet details
  create_resource_group = true
  location              = var.location
  deploy_environment    = var.deploy_environment
  environment           = var.environment
  org_name              = var.org_name

  # Log Analytics Workspaces
  linked_log_analytic_workspace_ids = [azurerm_log_analytics_workspace.example-log.id]

  # Private Endpoint details
  # Resource Group, location, VNet and Subnet details
  # This need to be the same as the VNet and Subnet where the Private Endpoint will be deployed
  existing_ampls_network_resource_group_name = azurerm_resource_group.example-network-rg.name
  existing_ampls_virtual_network_name        = azurerm_virtual_network.example-vnet.name
  existing_ampls_private_subnet_name         = azurerm_subnet.example-snet.name
}
