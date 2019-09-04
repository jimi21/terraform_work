variable "prefix" {}
variable "location" {}
variable "name" {}
variable "netid" {}

variable "os_disk_name" {
  default = "myosdisk1"
}
variable "data_disk_name" {
  default = "datadisk0"
}

variable "os_comp_name" {
  default = "hostname"
}

variable "admin_uname" {
  default = "testadmin"
}

variable "admin_pwd" {
  default = "Password1234!"
}