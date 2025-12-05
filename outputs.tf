output "instance_id" {
  description = "The ID of the compute instance"
  value       = google_compute_instance.this.id
}

output "instance_name" {
  description = "The name of the compute instance"
  value       = google_compute_instance.this.name
}

output "instance_self_link" {
  description = "The self link of the compute instance"
  value       = google_compute_instance.this.self_link
}

output "instance_zone" {
  description = "The zone of the compute instance"
  value       = google_compute_instance.this.zone
}

output "instance_private_ip" {
  description = "The private IP address of the compute instance"
  value       = google_compute_instance.this.network_interface[0].network_ip
}

output "instance_public_ip" {
  description = "The public IP address of the compute instance (null if not enabled)"
  value       = var.enable_public_ip ? google_compute_instance.this.network_interface[0].access_config[0].nat_ip : null
}

output "data_disks" {
  description = "Map of data disk names to their details (empty if none created)"
  value = {
    for k, v in google_compute_disk.this : k => {
      id        = v.id
      self_link = v.self_link
      name      = v.name
      size      = v.size
      type      = v.type
    }
  }
}
