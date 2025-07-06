# File: main.tf

# This file is used to create a Kubernetes cluster on Vultr using the Vultr Kubernetes module
# and the specified region and node pool labels.
module "kubernetes_cluster" {
  source            = "./modules/cluster/vultr"
  region            = local.vultr_region
  node_pools_label  = var.node_pools_label
  node_quantity     = var.node_quantity
  node_pools_labels = var.node_pools_labels
  plan              = var.plan
  vpc_id            = data.vultr_vpc.cluster_vpc.id
  tag               = var.tag
}
