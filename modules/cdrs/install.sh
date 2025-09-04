#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "🔨 Instalando CRDs do External Secrets Operator"
echo ""

kubectl apply -f "https://raw.githubusercontent.com/external-secrets/external-secrets/v0.19.2/deploy/crds/bundle.yaml" --server-side

echo ""
echo "✅ CRDs do External Secrets Operator instalados com sucesso."