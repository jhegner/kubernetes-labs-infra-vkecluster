#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "🔨 Instalando Namespace principal do lab"
echo ""

kubectl apply -f ./modules/namespace_lab/namespace.yaml

echo ""
echo "✅ Namespace criado com sucesso."