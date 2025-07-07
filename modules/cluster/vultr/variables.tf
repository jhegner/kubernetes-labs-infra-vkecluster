variable "dev_env" {
  description = "Development environment configuration for the Kubernetes cluster."
  type = object({
    node_quantity = number
    plan          = string
    label         = string
    labels        = map(string)
  })

}

variable "prod_env" {
  description = "Production environment configuration for the Kubernetes cluster."
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