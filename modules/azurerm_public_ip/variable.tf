variable public_ip_name{
    description = "name of public ip"
    type = string
}

variable public_ip_location{
    description = "location of public ip"
    type = string
}

variable resource_group_name{
    description = "resource group where public ip is present"
    type = string
}

variable allocation_method{
    description = "method of allocation Dynamic/Static"
    type = string
}