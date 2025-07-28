variable "sql_server_name" {
  type = string
  description = "name of sql server"
}

variable location{
  type = string
  description = "location of sql server"
}
variable "resource_group_name" {
  type = string
  description = "name of resource group in which we have the sql server"
}

variable "administrator_login" {
  type = string
  description = "administrator login of sql server"
}

variable "administrator_login_password" {
  type = string
  description = "password of administrator"
}