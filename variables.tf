variable "VULTR_API_KEY" {}

variable "node_pools_label" {
  description = "The label for the Kubernetes cluster."
  type        = string
  
}

variable "node_quantity" {
  description = "The number of nodes in the Kubernetes cluster."
  type        = number  
  
}

variable "plan" {
  description = "The plan for the nodes in the Kubernetes cluster."
  type        = string
  
}

variable "node_pools_labels" {
  description = "Labels to apply to the node pools."
  type        = map(string)

}


variable "tag" {
  description = "The tag to apply to the Kubernetes cluster."
  type        = string
  
}