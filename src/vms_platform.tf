###cloud vars
variable "vm_db_yandex_compute_instance" {
  type            = string
  default         = "netology-db"
  description     = "platform-name"
}

variable "vm_db_resources" {
  type = map
  default = {
    core = "2"
    memory = "2"
    core_fraction = "20"
  }
}

variable "vm_web_metadata" {
    type = map
    default = {
        ssh_key  = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEeCOZv/f9YQK0qjR8EqNQzmxddM4XP8t1KMh8dVBnfZFqJMsQl5GdEDx9VdvvJ9Ovt3fop6D3bI9Iul2vpqPFlo6HZOoUJQZnrWkPYGeNHmO2ntIfnK+NrM3k93qMXAujN7HD88VRUkcJD9DFXgsjU5ZhG2wpPQh39vUYWqLp933nnNgbAPkRfsgBukKweyAjYiCCU0jA3Y2Fi717MLETnvl1drgxUF0diK2k4RfOUaD5i8zk+r/m0fXgS9r9VxmPH8f2b2HWu/sSlFsZ0e0xoj15XeIKFvtOVC/qxK7Y9JAuuslyW/2JW//ZrTSxupUuHzwcBVo7diRno+MKp1j9jt1NlLwEuaHD5GxTBk8b61GpyJ4Ytcpis8hG8eAVG/PHC0NaxhZyZpYRV8UB/QPu1ZzeVpja82GkYeArrYstYkU8e5D9XJ9BlEVKqeaipTA7++u1uftJbiDSZwEIQuF9Sp70zHC5x+aSh3g9ncJN/zTICmdPpIYYiopBm1NwTD0= semen@ambarnov"
        value = 1
    }
}
