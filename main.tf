data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
    name = var.virtual_network
    resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "sn" {
    name = var.subnet
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network
}

resource "azurerm_network_interface" "nic" {
    for_each = var.network_interface
    name = each.value
    resource_group_name = var.resource_group_name
    location = var.location

    ip_configuration {
        name = "${var.vm_name[each.key]}-nic"
        subnet_id = data.azurerm_subnet.sn.id 
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "vm" {
    for_each = var.vm_name
    name = each.value
    resource_group_name = var.resource_group_name
    location = var.location
    vm_size = var.vm_size[each.key]
    network_interface_ids = [azurerm_network_interface.nic[each.key].id]

   storage_image_reference {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18_04-lts-gen2"
  version   = "latest"
}

storage_os_disk {
    name = "${var.vm_name[each.key]}-osdisk"
    caching = var.caching
    create_option = "FromImage"
    managed_disk_type = var.managed_disk_type[each.key]
    disk_size_gb = var.disk_size_gb[each.key]
}
 os_profile {
    computer_name = var.vm_name[each.key]
    admin_username = var.username
    admin_password = var.password
 }

 os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
 }
}

resource "azurerm_managed_disk" "amd" {
    for_each = var.vm_name
    name = each.value
    resource_group_name = var.resource_group_name
    location = var.location
    create_option = "Empty"
    storage_account_type = var.storage_account_type[each.key]
    disk_size_gb = var.data_disk_size_gb[each.key]
}

resource "azurerm_virtual_machine_data_disk_attachment" "dda" {
    for_each = var.vm_name
    managed_disk_id = azurerm_managed_disk.amd[each.key].id
    virtual_machine_id = azurerm_virtual_machine.vm[each.key].id
    lun = var.disk_count[each.key]
    caching = var.caching
}