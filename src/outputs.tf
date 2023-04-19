data "yandex_compute_instance" "netology-db-develop" {
  instance_id = "fhmu39ko62o6j0os8pik"
}

output "instance_external_ip_db" {
  value = "${data.yandex_compute_instance.netology-db-develop.network_interface.0.nat_ip_address}"
}

data "yandex_compute_instance" "netology-web-develop" {
  instance_id = "fhmh76o2rna4p73oeofe"
}

output "instance_external_ip_web" {
  value = "${data.yandex_compute_instance.netology-web-develop.network_interface.0.nat_ip_address}"
}
