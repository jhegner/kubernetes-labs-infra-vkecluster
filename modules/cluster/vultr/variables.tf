variable "region" {
  description = "The region to deploy the Kubernetes cluster in."
  type        = string    
}

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
  default     = "vc2-1c-2gb"
  
}

variable "node_pools_labels" {
  description = "Labels to apply to the node pools."
  type        = map(string)

}

variable "vpc_id" {
  description = "The ID of the VPC to deploy the Kubernetes cluster in."
  type        = string
  
}
