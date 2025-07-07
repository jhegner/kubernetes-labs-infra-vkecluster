# File: data.tf
# This file is used to define data sources for the Vultr Kubernetes cluster module
data "vultr_vpc" "cluster_vpc" {
  filter {
    name = "description"
    values = ["kubernetes labs vpc network"]
  }
}

data "vultr_firewall_group" "firewall_group" {
  filter {
    name = "description"
    values = ["kubernetes lab firewall group"]
  }
}
