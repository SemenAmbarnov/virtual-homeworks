data "yandex_compute_instance" "netology-develop-platform-db" {
  instance_id = "fhmb80o6pcqnva9g1gm9"
}

output "instance_external_ip_db" {
  value = "${data.yandex_compute_instance.netology-develop-platform-db.network_interface.0.nat_ip_address}"
}

data "yandex_compute_instance" "netology-develop-platform-web" {
  instance_id = "fhmlmdc24oc513mn6hsn"
}

output "instance_external_ip_web" {
  value = "${data.yandex_compute_instance.netology-develop-platform-web.network_interface.0.nat_ip_address}"
}
