#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "🔨 Instalando Namespaces principais do lab"
echo ""

kubectl apply -f ./modules/namespace/all-namespaces.yaml

echo ""
echo "✅ Namespaces criados com sucesso."