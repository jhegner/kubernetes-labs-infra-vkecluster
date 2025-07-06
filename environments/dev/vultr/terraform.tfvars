# This file is used to set the variables for the Vultr Kubernetes cluster module.
node_quantity    = 1
plan             = "vc2-1c-2gb"
node_pools_label = "development"
node_pools_labels = {
  lab     = "kubernetes-labs"
  env     = "dev"
  team    = "infra"
  region  = "atl"
  plan    = "vc2-1c-2gb"
  cluster = "labs-infra-cluster"
}

# All kubernetes resources have a default node pool with a tag of tf-vke-default. 
# In order to avoid errors, ensure that there is a node pool with that tag set.
tag = "tf-vke-default"
