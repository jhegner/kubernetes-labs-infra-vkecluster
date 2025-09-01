# This file is used to set the variables for Vultr Kubernetes Engine (VKE).

lab_env = {
  node_quantity = 3
  plan          = "vc2-2c-4gb"
  label         = "laboratorio"
  labels = {
    lab     = "kubernetes-labs"
    env     = "lab"
    team    = "infra"
    region  = "atl"
    plan    = "vc2-2c-4gb"
    cluster = "labs-infra-cluster"
    tag     = "laboratorio"
  }
  tag = "laboratorio"
}

