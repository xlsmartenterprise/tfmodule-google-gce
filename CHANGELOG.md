# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-12-05

### Added
- Initial release of Google Compute Engine (GCE) Terraform module
- Support for creating Google Compute Engine instances with customizable machine types
- Configurable boot disk with image, size, and type options
- Optional data disk creation and attachment with multiple disk support
- Network configuration with VPC, subnetwork, and private IP assignment
- Optional public IP address with configurable network tier (PREMIUM/STANDARD)
- Network tags support for firewall rules integration
- Resource manager tags support for resource organization
- Comprehensive outputs including instance details, IPs, and data disk information
- Terraform version constraint (>= 1.5.0)
- Google provider version constraint (>= 7.0.0, < 8.0.0)
- Google-beta provider version constraint (>= 7.0.0, < 8.0.0)

### Features
- Dynamic data disk management with for_each loop
- Conditional resource creation based on data disk configuration
- Network tier validation (PREMIUM or STANDARD)
- Flexible resource tagging with both network and resource manager tags
- Support for custom private IP assignment
- Automatic data disk attachment to compute instance