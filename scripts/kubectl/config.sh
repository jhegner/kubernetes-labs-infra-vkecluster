#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "█╗  ██╗ █████╗ ███████╗       ██╗      █████╗ ██████╗"
echo "██║ ██╔╝██╔══██╗██╔════╝      ██║     ██╔══██╗██╔══██╗"
echo "█████╔╝ ╚█████╔╝███████╗█████╗██║     ███████║██████╔╝"
echo "██╔═██╗ ██╔══██╗╚════██║╚════╝██║     ██╔══██║██╔══██╗"
echo "██║  ██╗╚█████╔╝███████║      ███████╗██║  ██║██████╔╝"
echo "╚═╝  ╚═╝ ╚════╝ ╚══════╝      ╚══════╝╚═╝  ╚═╝╚═════╝"

# Verifica se a variável de API está definida
if [[ -z "${VULTR_API_KEY:-}" ]]; then
  echo "❌ A variável VULTR_API_KEY não está definida."
  echo "Defina com: export VULTR_API_KEY=seu_token"
  exit 1
fi

# 1 - Lista clusters
echo "🔍 Consultando clusters Kubernetes no Vultr Cloud."
clusters_json=$(curl -s -H "Authorization: Bearer ${VULTR_API_KEY}" \
  "https://api.vultr.com/v2/kubernetes/clusters")

#echo "clusters_json: $clusters_json"  

if [ "$(echo "$clusters_json" | jq '.vke_clusters | length')" -eq 0 ]; then
  echo "❌ Não foi encontrado clusters provisionados no ambiente."
  exit 1
fi  

# 2 - Pega o ID do cluster com label contendo 'kubernetes-labs-cluster'
cluster_id=$(echo $clusters_json | jq -r '.vke_clusters[] | select(.label | contains("kubernetes-labs-cluster")) | .id')

if [[ -z "$cluster_id" ]]; then
  echo "❌ Não foi encontrado cluster com label 'kubernetes-labs-cluster'."
  exit 1
fi

echo "✅ Cluster encontrado: $cluster_id"

# 3 - Baixa kubeconfig Base64
echo "📥 Baixando kubeconfig Base64..."
config_json=$(curl -s -H "Authorization: Bearer ${VULTR_API_KEY}" \
  "https://api.vultr.com/v2/kubernetes/clusters/$cluster_id/config")

# echo "config_json: $config_json"  

# 4 - Extrai valor base64 e exporta
kubeconfig_base64=$(echo "$config_json" | jq -r '.kube_config')

if [[ -z "$kubeconfig_base64" ]]; then
  echo "❌ kube_config não encontrado na resposta da API."
  exit 1
fi

echo "✅ kube_config Base64 obtido com sucesso."

export VKE_CLUSTER_KUBECONFIG_BASE64="$kubeconfig_base64"
echo "✅ Variável de ambiente VKE_CLUSTER_KUBECONFIG_BASE64 configurada."

# 5 - Cria arquivo de kubeconfig decodificado
mkdir -p ~/.kube
echo "$VKE_CLUSTER_KUBECONFIG_BASE64" | base64 -d > ~/.kube/config-k8s-labs
chmod 600 ~/.kube/config-k8s-labs
echo "✅ Arquivo kubeconfig criado: ~/.kube/config-k8s-labs"

# 6 - Exporta contexto
export KUBECONFIG=~/.kube/config-k8s-labs
source ~/.bashrc
echo "✅ Contexto configurado"

# 7 - Testa conexão
echo "🔎 Verificando acesso ao cluster..."
kubectl get nodes
echo "✅ Acesso ao cluster verificado com sucesso."

echo "🎉 Configuração concluída com sucesso!"
echo "🤖 Script gerado com ajuda de IA"