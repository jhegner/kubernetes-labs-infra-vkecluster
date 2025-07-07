# The main.tf file is the entry point for the Terraform configuration.

# Provision a Kubernetes cluster on Vultr using the specified configurations.
module "kubernetes_cluster" {
  source = "./modules/cluster/vultr"
  region = local.vultr_region
  vpc_id = data.vultr_vpc.cluster_vpc.id
  dev_env = {
    node_quantity = var.dev_env.node_quantity
    plan          = var.dev_env.plan
    label         = var.dev_env.label
    labels        = var.dev_env.labels
  }
  prod_env = {
    node_quantity = var.prod_env.node_quantity
    plan          = var.prod_env.plan
    label         = var.prod_env.label
    labels        = var.prod_env.labels
    tag           = var.prod_env.tag
  }

}
