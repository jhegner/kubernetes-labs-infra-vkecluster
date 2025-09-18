#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

# echo "Nao há CRDs para instalar neste momento."

# Exemplo de instalação de CRD:
# kubectl apply -f https://example.com/path/to/crd.yaml
# kubectl wait --for=condition=established --timeout=60s crd/myresources.example.com
# kubectl get crd myresources.example.com
# echo "CRD 'myresources.example.com' instalada com sucesso."

echo "🚨 Iniciando a instalacao de CustomResourceDefinition no cluster"

# -- Adicione aqui outros comandos de instalação de CRDs conforme necessário.

echo "🔨 cert-manager: instalando CustomResourceDefinition resources..."

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.18.2/cert-manager.crds.yaml

echo "🟢 cert-manager: CRDs instalado com sucesso"

# -- Fim... de outros comandos de instalação de CRDs.

echo "🚀 Finalizado a instalacao..."