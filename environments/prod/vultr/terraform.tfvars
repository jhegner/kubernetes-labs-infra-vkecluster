# This file is used to set the variables for the Vultr Kubernetes cluster module.
node_quantity  = 2
plan           = "vc2-2c-4gb"
node_pools_label = "production"
node_pools_labels = {
    lab = "kubernetes-labs"
    env = "prod"
    team = "infra"
    region = "atl"
    plan = "vc2-2c-4gb"
    cluster = "labs-infra-cluster"
}