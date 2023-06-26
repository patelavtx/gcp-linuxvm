output "vm_name" {
  description = "VM Name"
  value = google_compute_instance.vm_instance_public.name
}
output "vm_pubicip" {
  description = "Public IP"
  value = google_compute_instance.vm_instance_public.network_interface[0].access_config[0].nat_ip
}

