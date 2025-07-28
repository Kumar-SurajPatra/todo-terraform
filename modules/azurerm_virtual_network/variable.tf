variable vNet_name{
    type = string
    description = "vNet ka naam"
}

variable vNet_location{
    type = string
    description = "vNet ka location"
}

variable vNet_rg_name{
    type = string
    description = "vNet konse rg me he uska naam"
}

variable vNet_address_space{
    type = list(string)
    description = "vNet ka address space"
}