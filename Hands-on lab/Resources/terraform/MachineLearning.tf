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