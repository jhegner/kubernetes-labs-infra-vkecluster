terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

resource "vultr_kubernetes" "labs_cluster" {
  region          = var.region
  vpc_id          = var.vpc_id
  label           = local.cluster_label
  version         = local.version
  enable_firewall = local.enable_firewall

  # Create a default node pool for lab environment
  node_pools {
    node_quantity = var.lab_env.node_quantity
    plan          = var.lab_env.plan
    label         = var.lab_env.label
    labels        = var.lab_env.labels
    auto_scaler   = local.auto_scaler 
  }

}