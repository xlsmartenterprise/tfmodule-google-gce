variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "machine_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the instance (e.g., e2-medium, n1-standard-1)"
  type        = string
}

variable "zone" {
  description = "The zone where the instance will be created"
  type        = string
}

variable "resource_manager_tags" {
  description = "Resource manager tags to apply to the instance. Leave empty to skip"
  type        = map(string)
  default     = {}
}

# Network Configuration
variable "network_tags" {
  description = "Network tags to apply to the instance. Leave empty to skip"
  type        = list(string)
  default     = []
}

# Boot Disk Configuration
variable "image" {
  description = "The image from which to initialize the boot disk"
  type        = string
}

variable "boot_disk_size" {
  description = "Size of the boot disk in GB"
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "Type of boot disk (pd-standard, pd-ssd, pd-balanced)"
  type        = string
  default     = "pd-balanced"
}

# Data Disks Configuration (Optional)
variable "data_disks" {
  description = "List of data disks to create and attach. Leave empty/null to skip data disk creation"
  type = list(object({
    name = string
    type = string
    size = number
  }))
  default = null
}

# Network Configuration
variable "network" {
  description = "The VPC network to attach the instance to"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to attach the instance to"
  type        = string
}

variable "network_ip" {
  description = "Private IP address to assign to the instance"
  type        = string
  default     = null
}

variable "enable_public_ip" {
  description = "Enable public IP address for the instance"
  type        = bool
  default     = false
}

variable "network_tier" {
  description = "Network tier for public IP (PREMIUM or STANDARD)"
  type        = string
  default     = "PREMIUM"
}

variable "service_account_email" {
  description = "The service account email to attach to the instance. If null, no service account will be attached"
  type        = string
  default     = null
}

variable "service_account_scopes" {
  description = "List of service account scopes to attach to the instance. Only used if service_account_email is provided"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}
