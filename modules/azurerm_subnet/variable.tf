variable subNet_name{
    type = string
    description = "subnet ka naam"
}

variable subNet_rg_name {
  type = string
  description = "subnet jis rg me he uska naam"
}

variable subNet_vNet_name {
  type = string
  description = "subnet jis vNet me he uska naam"
}

variable subNet_address_prefixes {
  type = list(string)
  description = "subnet ka address prefixes"
}