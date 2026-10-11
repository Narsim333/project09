variable "location" {
  type = string
}
variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "virtual_network" {
  type = string
}

variable "subnet" {
  type = string
}

variable "vm_name" {
  type = map(string)
}

variable "vm_size" {
  type = map(string)
}

variable "network_interface" {
  type = map(string)
}

variable "sku" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "caching" {
  type = string
}

variable "disable_password_authentication" {
  type = bool
}

variable "managed_disk_type" {
  type = map(string)
}

variable "disk_size_gb" {
  type = map(string)
}

variable "storage_account_type" {
  type = map(string)
}

variable "data_disk_size_gb" {
  type = map(string)
}

variable "disk_count" {
  type = map(string)
}

