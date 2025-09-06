# ubuntu os options
variable "ubuntu_2204_sku" {
  type        = string
  description = "SKU for Ubuntu 22.04 LTS"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}
variable "ubuntu__2404_sku_amd64" {
  type        = string
  description = "SKU for Ubuntu PRO 24.04 LTS amd64"
  default     = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
}


# Network
variable "vpc_name" {
  type        = string
  description = "vpc"
}

variable "network_subnet_name" {
  type        = string
  description = "subnet"
}

variable "gcp_zone" {
  type        = string
  description = ""
}


# VM
variable "linux_instance_type" {
  type        = string
  description = "VM instance type"
  default     = "f1-micro"
}

variable "vm_name" {
  type        = string
  description = ""
  default = "gcp-spoke1-vm1"
}

variable "labels" {
  description = "vm tags"
  type        = map(string)
  default = { env = "test"}
}
