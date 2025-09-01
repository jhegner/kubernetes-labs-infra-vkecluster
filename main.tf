# The main.tf file is the entry point for the Terraform configuration.

# Provision a Kubernetes cluster on Vultr using the specified configurations.
module "kubernetes_cluster" {
  source = "./modules/cluster"
  region = local.vultr_region
  vpc_id = data.vultr_vpc.cluster_vpc.id
  lab_env = {
    node_quantity = var.lab_env.node_quantity
    plan          = var.lab_env.plan
    label         = var.lab_env.label
    labels        = var.lab_env.labels
    tag           = var.lab_env.tag
  }

}
