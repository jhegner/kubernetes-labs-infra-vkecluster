variable "lab_env" {
  description = "Labs environment configuration for all Nodes of Kubernetes cluster."
  type = object({
    node_quantity = number
    plan          = string
    label         = string
    labels        = map(string)
    tag           = string
  })

}


variable "region" {
  description = "The region to deploy the Kubernetes cluster in."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to deploy the Kubernetes cluster in."
  type        = string
  
}