output "vm_name" {
  description = "VM Name"
  value = google_compute_instance.vm_instance_public.name
}
output "vm" {
  description = "Public IP"
  value = google_compute_instance.vm_instance_public
}
