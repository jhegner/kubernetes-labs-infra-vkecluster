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
  label           = local.cluster_label
  version         = local.version
  enable_firewall = local.enable_firewall
  vpc_id          = var.vpc_id

  # A default node pool is required when first creating the resource but it can be removed at a later point
  node_pools {
    node_quantity = 1
    plan          = "vc2-1c-2gb"
    label         = "vke-default-first-creating"
    auto_scaler   = false
  }

}

# This resource is used to create additional node pools in the cluster
# It is not required to create a node pool when first creating the cluster
# but it is useful to have this resource to manage node pools separately
# It can be used to add, remove or update node pools in the cluster
# The node pools can be managed separately from the cluster resource
#resource "vultr_kubernetes_node_pools" "labs_cluster_node_pools" {
#  cluster_id    = vultr_kubernetes.labs_cluster.id
#  node_quantity = var.node_quantity
#  plan          = var.plan
#  label         = var.node_pools_label
#  labels        = var.node_pools_labels
#  tag = var.tag
#}
