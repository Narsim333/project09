location        = "germanywestcentral"
subscription_id = "cf37771b-e6ab-4edb-ae69-c4a9d01b184a"
resource_group_name = "rg-network-gwc-1012"
virtual_network = "vnet-bizprod-gwc-1014"
subnet          = "subnet1-vnet-bizprod-gwc-1014"
vm_name = {
    azubl2204 = "azubl2204"
    azubl1993 = "azubl1993"
}

vm_size      = {
    azubl2204 = "Standard_D4s_v5"
    azubl1993 = "Standard_D4s_v5"
}

network_interface = {
    azubl2204 = "test-nic1-gwc-1014"
    azubl1993 = "test-nic2-gwc-1014"
}

sku = "18_04-lts-gen2"

username = "labadmin"
password = "P@ssw0rd@22"

disable_password_authentication = "false"

caching = "ReadWrite"

managed_disk_type = {
    azubl2204 = "Standard_LRS"
    azubl1993 = "Premium_LRS"
}

disk_size_gb = {
    azubl2204 = "32"
    azubl1993 = "64"
}

storage_account_type = {
    azubl2204 = "Premium_LRS"
    azubl1993 = "Standard_LRS"
}

data_disk_size_gb = {
    azubl2204 = "80"
    azubl1993 = "100"
}

disk_count = {
    azubl2204 = "32"
    azubl1993 = "64"
}


