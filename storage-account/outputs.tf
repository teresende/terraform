output "azurerm_storage_account" {
  value = "${azurerm_storage_account.storage-example.name}"
}

output "sas_url_query_string" {
  value = data.azurerm_storage_account_sas.sas-example.sas
}