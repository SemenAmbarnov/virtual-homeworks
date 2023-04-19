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
  default         = "netology-web"
  description     = "platform-name"
}

variable "vm_web_yandex_compute_instance_1" {
  type            = string
  default         = "standard-v1"
  description     = "platform_id"
}

variable "vm_web_resources" {
  type = map
  default = {
    core = "2"
    memory = "1"
    core_fraction = "5"
  }
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
