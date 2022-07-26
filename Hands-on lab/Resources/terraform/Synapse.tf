#######################################################################
## Create Storage Account
#######################################################################

resource "azurerm_storage_account" "adlsaccount" {
  name                     = "sapadls${local.suffix}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

#######################################################################
## Create ADLS filesystem
#######################################################################

resource "azurerm_storage_data_lake_gen2_filesystem" "adls" {
  name               = "sap-mcw-adls"
  storage_account_id = azurerm_storage_account.adlsaccount.id
}

#######################################################################
## Create ADLS path
#######################################################################

resource "azurerm_storage_container" "staging" {
  container_access_type = "private"
  name                  = "staging"
  storage_account_name  = azurerm_storage_account.adlsaccount.name
}

#######################################################################
## Move payments data
#######################################################################
resource "azurerm_storage_container" "payment_data_container" {
  container_access_type = "private"
  name                  = "payment-data-csv"
  storage_account_name  = azurerm_storage_account.adlsaccount.name
}

resource "azurerm_storage_blob" "payment_data_file" {
  name                   = "paymentData_CAL2021.csv"
  storage_account_name   = azurerm_storage_account.adlsaccount.name
  storage_container_name = azurerm_storage_container.payment_data_container.name
  type                   = "Block"
  source                 = "${path.module}/data/paymentData_CAL2021.csv"
}

#######################################################################
## Create container for external table files
#######################################################################
resource "azurerm_storage_container" "salespayment_data_container" {
  container_access_type = "private"
  name                  = "sales-payment-parquet"
  storage_account_name  = azurerm_storage_account.adlsaccount.name
}

#######################################################################
## Create Synapse Workspace
#######################################################################

resource "azurerm_synapse_workspace" "synapse" {
  name                                 = "sapdatasynws${local.suffix}"
  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = azurerm_resource_group.rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.adls.id
  sql_administrator_login              = local.sqladminuser
  sql_administrator_login_password     = local.sqladminpwd

  identity {
    type = "SystemAssigned"
  }
}

#######################################################################
## Open the Firewall for the Synapse Workspace
#######################################################################

resource "azurerm_synapse_firewall_rule" "allowall" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
}

#######################################################################
## Create Synapse SQL Pool
#######################################################################

resource "azurerm_synapse_sql_pool" "sqlpool" {
  name                 = "sapdatasynsql"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  sku_name             = "DW100c"
  create_mode          = "Default"
}

#######################################################################
## Create Spark Pool
#######################################################################
resource "azurerm_synapse_spark_pool" "synapse_poc" {
  name                           = "SparkPoolSmall"
  node_size                      = "Small"
  node_size_family               = "MemoryOptimized"
  session_level_packages_enabled = true
  spark_version                  = 3.2
  synapse_workspace_id           = azurerm_synapse_workspace.synapse.id

  auto_scale {
    max_node_count = 10
    min_node_count = 3
  }

  auto_pause {
    delay_in_minutes = 15
  }
}

#######################################################################
## Authorize Synapse to ADLS Account (set at the resource group level)
#######################################################################
resource "azurerm_role_assignment" "synapsetoadls" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.synapse.identity[0].principal_id
}

#######################################################################
## Authorize Synapse to Azure Machine Learning (set at the resource group level)
#######################################################################
resource "azurerm_role_assignment" "synapsetoaml" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_synapse_workspace.synapse.identity[0].principal_id
}
