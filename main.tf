locals {
  create_data_disks = var.data_disks != null && length(var.data_disks) > 0
}

resource "google_compute_disk" "this" {
  for_each = local.create_data_disks ? { for disk in var.data_disks : disk.name => disk } : {}

  name    = each.value.name
  type    = each.value.type
  zone    = var.zone
  size    = each.value.size
  project = var.project_id
}

resource "google_compute_instance" "this" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id
  tags         = var.network_tags

  dynamic "params" {
    for_each = length(var.resource_manager_tags) > 0 ? [1] : []
    content {
      resource_manager_tags = var.resource_manager_tags
    }
  }

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  dynamic "attached_disk" {
    for_each = local.create_data_disks ? var.data_disks : []
    content {
      source      = google_compute_disk.this[attached_disk.value.name].self_link
      device_name = attached_disk.value.name
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    network_ip = var.network_ip

    dynamic "access_config" {
      for_each = var.enable_public_ip ? [1] : []
      content {
        network_tier = var.network_tier
      }
    }
  }

  dynamic "service_account" {
    for_each = var.service_account_email != null ? [1] : []
    content {
      email  = var.service_account_email
      scopes = var.service_account_scopes
    }
  }

  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }
}
