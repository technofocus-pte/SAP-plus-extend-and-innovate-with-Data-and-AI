#######################################################################
## Create Application Insights
#######################################################################

resource "azurerm_application_insights" "insights" {
  name                = "sap-mcw-insights"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
}

#######################################################################
## Create Blob Storage Account
#######################################################################

resource "azurerm_storage_account" "blobaccount" {
  name                     = "sapblob${local.suffix}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#######################################################################
## Create Machine Learning Workspace
#######################################################################

resource "azurerm_machine_learning_workspace" "mlws" {
  name                    = "sap-mcw-ml-ws"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  application_insights_id = azurerm_application_insights.insights.id
  key_vault_id            = azurerm_key_vault.keyvault.id
  storage_account_id      = azurerm_storage_account.blobaccount.id

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_key_vault_access_policy" "aml_kv_policy" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = local.tenant_id
  object_id    = azurerm_machine_learning_workspace.mlws.identity.0.principal_id

  key_permissions = [
    "Create", "Delete", "Get", "List", "Purge"
  ]

  secret_permissions = [
    "Delete", "Get", "List", "Purge", "Recover", "Set"
  ]
}