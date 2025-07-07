# Global variables for the Vult and AWS regions
locals {
  vultr_region = "atl"
  aws_region  = "us-east-1"
}

# Define the region for the container registry
locals {
  container_registry_region = "ewr"
  container_registry_plan   = "start_up"
}