# This file is used to set the variables for Vultr Kubernetes Engine (VKE).
# It defines the development and production environments with their 
# respective configurations, each environment are segregated by node pools.

dev_env = {
  node_quantity = 1
  plan          = "vc2-1c-2gb"
  label         = "development"
  labels = {
    lab     = "kubernetes-labs"
    env     = "dev"
    team    = "infra"
    region  = "atl"
    plan    = "vc2-1c-2gb"
    cluster = "labs-infra-cluster"
    tag     = "development"
  }
}

prod_env = {
  node_quantity = 2
  plan          = "vc2-2c-4gb"
  label         = "production"
  labels = {
    lab     = "kubernetes-labs"
    env     = "prod"
    team    = "infra"
    region  = "atl"
    plan    = "vc2-2c-4gb"
    cluster = "labs-infra-cluster"
    tag     = "production"
  }
  tag = "production"
}

