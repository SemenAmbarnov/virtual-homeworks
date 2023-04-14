resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family         = var.vm_web_family
}
resource "yandex_compute_instance" "platform_web" {
  name           = var.vm_web_yandex_compute_instance
  platform_id    = var.vm_web_yandex_compute_instance_1
  resources {
    cores         = var.vm_web_resources_core
    memory        = var.vm_web_resources_memory
    core_fraction = var.vm_web_resources_core_fraction
  } 
  boot_disk {
    initialize_params {
     image_id     = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible   = var.vm_web_scheduling_policy
  }
  network_interface {
    subnet_id     = yandex_vpc_subnet.develop.id
    nat           = var.vm_web_network_interface_nat
  }
  metadata = {
    serial-port-enable = var.vm_web_metadata
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}


########################################################################

resource "yandex_compute_instance" "platform_db" {
  name           = var.vm_db_yandex_compute_instance
  resources {
    cores         = var.vm_db_resources_core
    memory        = var.vm_db_resources_memory
    core_fraction = var.vm_db_resources_core_fraction
  }
  boot_disk {
    initialize_params {
     image_id     = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible   = var.vm_web_scheduling_policy
  }
  network_interface {
    subnet_id     = yandex_vpc_subnet.develop.id
    nat           = var.vm_web_network_interface_nat
  }
  metadata = {
    serial-port-enable = var.vm_web_metadata
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}