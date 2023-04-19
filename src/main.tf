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
  name           = local.vm_web
  platform_id    = var.vm_web_yandex_compute_instance_1
  resources {
    cores         = var.vm_web_resources.core
    memory        = var.vm_web_resources.memory
    core_fraction = var.vm_web_resources.core_fraction
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
    serial-port-enable = var.vm_web_metadata.value
    ssh-keys           = var.vm_web_metadata.ssh_key
  }
}


########################################################################

resource "yandex_compute_instance" "platform_db" {
  name           = local.vm_db
  resources {
    cores         = var.vm_db_resources.core
    memory        = var.vm_db_resources.memory
    core_fraction = var.vm_db_resources.core_fraction
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
    serial-port-enable = var.vm_web_metadata.value
    ssh-keys           = var.vm_web_metadata.ssh_key
  }
}
