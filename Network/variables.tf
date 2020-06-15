variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  default     = "mad-rg"
}


variable "resource_group_location" {
  description = "The name of an existing resource group to be imported."
  default     = "West Europe"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "mad-net"
}


variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}


variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1"]
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}



variable "security_group_name" {
  description = "The Name to use for the security_group."
  default     = "ssh"
}


variable "security_group_location" {
  description = "The Location to use for the security_group"
  default     = "West Europe"
}

