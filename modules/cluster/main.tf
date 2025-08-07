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

  # Create a default node pool for development environment
  node_pools {
    node_quantity = var.dev_env.node_quantity
    plan          = var.dev_env.plan
    label         = var.dev_env.label
    labels        = var.dev_env.labels
    auto_scaler   = local.auto_scaler 
  }

}

# Create a a node pool for production environment in the same cluster
resource "vultr_kubernetes_node_pools" "labs_cluster_node_pools" {
  cluster_id    = vultr_kubernetes.labs_cluster.id
  node_quantity = var.prod_env.node_quantity
  plan          = var.prod_env.plan
  label         = var.prod_env.label
  labels        = var.prod_env.labels
  tag           = var.prod_env.tag

  depends_on = [ vultr_kubernetes.labs_cluster ]
}
