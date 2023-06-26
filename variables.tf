# ubuntu os options
variable "ubuntu_1804_sku" {
  type        = string
  description = "SKU for Ubuntu 18.04 LTS"
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}
variable "ubuntu_2004_sku" {
  type        = string
  description = "SKU for Ubuntu 20.04 LTS"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}
variable "ubuntu_pro_1604_sku" {
  type        = string
  description = "SKU for Ubuntu PRO 16.04 LTS"
  default     = "ubuntu-os-pro-cloud/ubuntu-pro-1604-lts"
}
variable "ubuntu_pro_1804_sku" {
  type        = string
  description = "SKU for Ubuntu PRO 18.04 LTS"
  default     = "ubuntu-os-pro-cloud/ubuntu-pro-1804-lts"
}
variable "ubuntu_pro_2004_sku" {
  type        = string
  description = "SKU for Ubuntu PRO 20.04 LTS"
  default     = "ubuntu-os-pro-cloud/ubuntu-pro-2004-lts"
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

