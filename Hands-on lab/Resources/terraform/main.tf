locals {
  currentuserobjectid   = data.azuread_client_config.current.object_id
  sqladminpwd           = random_password.sqladmin_pwd.result
  sqladminuser          = "sqladminuser"
  subscription_id       = data.azurerm_client_config.current.subscription_id
  suffix                = random_string.service_suffix.result
  synapsefilesystemname = "defaultfs"
  tenant_id             = data.azurerm_client_config.current.tenant_id
}

data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}

resource "random_string" "service_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "random_password" "sqladmin_pwd" {
  length           = 14
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
  min_upper        = 2
  override_special = "_%@"
  special          = true
}

#######################################################################
## Create Resource Group
#######################################################################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#######################################################################
## Assign Storage Role to User
#######################################################################

resource "azurerm_role_assignment" "storagerole" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = local.currentuserobjectid
}

#######################################################################
## Create Virtual Networks
#######################################################################

resource "azurerm_virtual_network" "vnet" {
  name                = "sap-mcw-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.20.0.0/16"]
}

#######################################################################
## Create Subnet
#######################################################################

resource "azurerm_subnet" "subnet" {
  name                 = "sap-mcw-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.20.1.0/24"]
}

#######################################################################
## Create Network Security Group
#######################################################################

resource "azurerm_network_security_group" "nsg" {
  name                = "sap-mcw-nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#######################################################################
## Associate the subnet with the NSG
#######################################################################

resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#######################################################################
## Create Key Vault
#######################################################################

resource "azurerm_key_vault" "keyvault" {
  name                = "sapkv${local.suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tenant_id           = local.tenant_id
  sku_name            = "standard"


  access_policy {
    tenant_id          = local.tenant_id
    object_id          = azurerm_synapse_workspace.synapse.identity.0.principal_id
    secret_permissions = ["Get", "List"]
  }

  access_policy {
    tenant_id = local.tenant_id
    object_id = local.currentuserobjectid
    key_permissions = [
      "Create", "Delete", "Get", "List", "Purge"
    ]

    secret_permissions = [
      "Delete", "Get", "List", "Purge", "Recover", "Set"
    ]
  }
}

#######################################################################
## Add secret to Key Vault
#######################################################################
resource "azurerm_key_vault_secret" "sqladmin_pwd_secret" {
  key_vault_id = azurerm_key_vault.keyvault.id
  name         = "sql-admin-pwd"
  value        = local.sqladminpwd
}

resource "azurerm_key_vault_secret" "sqladmin_uname_secret" {
  key_vault_id = azurerm_key_vault.keyvault.id
  name         = "sql-admin-username"
  value        = local.sqladminuser
}