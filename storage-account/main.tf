provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "rg-example" {
  name     = "${var.prefix}resources"
  location = var.location
}

resource "azurerm_storage_account" "storage-example" {
  name                     = "${var.prefix}storageacct"
  resource_group_name      = azurerm_resource_group.rg-example.name
  location                 = azurerm_resource_group.rg-example.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  access_tier               = "Hot"
  allow_blob_public_access  = true  
}

resource "azurerm_storage_container" "container-example" {
  name                  = "${var.prefix}storagecontainer"
  storage_account_name  = azurerm_storage_account.storage-example.name
  container_access_type = "blob"
}

data "azurerm_storage_account_sas" "sas-example" {
  connection_string = azurerm_storage_account.storage-example.primary_connection_string
  https_only        = true
  signed_version    = "2017-07-29"

  resource_types {
    service   = false
    container = true
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2020-09-16"
  expiry = "2020-12-31"

  permissions {
    read    = false
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
  }
}