locals {
  vm_web = "${var.vm_web_yandex_compute_instance}-${var.vpc_name}"
  vm_db = "${var.vm_db_yandex_compute_instance}-${var.vpc_name}"
}
