output "kubernetes_cluster_id" {
  value = vultr_kubernetes.labs_cluster.id
  
}

output "firewall_group_id" {
  value = vultr_kubernetes.labs_cluster.firewall_group_id
}