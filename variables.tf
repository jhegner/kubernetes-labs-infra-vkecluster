variable "VULTR_API_KEY" {}

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