###cloud vars

variable "token" {
  type            = string
  description     = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type            = string
  description     = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type            = string
  description     = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type            = string
  default         = "ru-central1-a"
  description     = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type            = list(string)
  default         = ["10.0.1.0/24"]
  description     = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type            = string
  default         = "develop"
  description     = "VPC network & subnet name"
}

variable "vm_web_family" {
  type            = string
  default         = "ubuntu-2004-lts"
  description     = "yandex_compute_image"
}

variable "vm_web_yandex_compute_instance" {
  type            = string
  default         = "netology-develop-platform-web"
  description     = "platform-name"
}

variable "vm_web_yandex_compute_instance_1" {
  type            = string
  default         = "standard-v1"
  description     = "platform_id"
}

variable "vm_web_resources_core" {
  type            = number
  default         = 2
  description     = "core"
}

variable "vm_web_resources_memory" {
  type            = number
  default         = 1
  description     = "memory"
}

variable "vm_web_resources_core_fraction" {
  type            = number
  default         = 5
  description     = "core_fraction"
}

variable "vm_web_scheduling_policy" {
    type          = string
    default       = "true"
    description   = "preemptible" 
}

variable "vm_web_network_interface" {
    type          = string
    default       = "network_id"
    description   = "subnet_id"
}

variable "vm_web_network_interface_nat" {
    type          = string
    default       = "true"
    description   = "nat"
}

variable "vm_web_metadata" {
    type          = number
    default       = 1
    description   = "serial-port-enable" 
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEeCOZv/f9YQK0qjR8EqNQzmxddM4XP8t1KMh8dVBnfZFqJMsQl5GdEDx9VdvvJ9Ovt3fop6D3bI9Iul2vpqPFlo6HZOoUJQZnrWkPYGeNHmO2ntIfnK+NrM3k93qMXAujN7HD88VRUkcJD9DFXgsjU5ZhG2wpPQh39vUYWqLp933nnNgbAPkRfsgBukKweyAjYiCCU0jA3Y2Fi717MLETnvl1drgxUF0diK2k4RfOUaD5i8zk+r/m0fXgS9r9VxmPH8f2b2HWu/sSlFsZ0e0xoj15XeIKFvtOVC/qxK7Y9JAuuslyW/2JW//ZrTSxupUuHzwcBVo7diRno+MKp1j9jt1NlLwEuaHD5GxTBk8b61GpyJ4Ytcpis8hG8eAVG/PHC0NaxhZyZpYRV8UB/QPu1ZzeVpja82GkYeArrYstYkU8e5D9XJ9BlEVKqeaipTA7++u1uftJbiDSZwEIQuF9Sp70zHC5x+aSh3g9ncJN/zTICmdPpIYYiopBm1NwTD0= semen@ambarnov"
  description = "ssh-keygen -t ed25519"
}
