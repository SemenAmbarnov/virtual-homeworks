###cloud vars
variable "vm_db_yandex_compute_instance" {
  type            = string
  default         = "netology-develop-platform-db"
  description     = "platform-name"
}

variable "vm_db_resources_core" {
  type            = number
  default         = 2
  description     = "core"
}

variable "vm_db_resources_memory" {
  type            = number
  default         = 2
  description     = "memory"
}

variable "vm_db_resources_core_fraction" {
  type            = number
  default         = 20
  description     = "core_fraction"
}

