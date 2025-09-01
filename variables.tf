variable "VULTR_API_KEY" {}

variable "lab_env" {
  description = "Labs environment configuration for all Nodes of the Kubernetes cluster."
  type = object({
    node_quantity = number
    plan          = string
    label         = string
    labels        = map(string)
    tag           = string
  })

}