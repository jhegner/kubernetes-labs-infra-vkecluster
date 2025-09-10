#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "🔥 Desinstalando helm charts"
echo ""

helm uninstall lab-helm-addons -n labs
helm uninstall lab-helm-secrets -n labs
helm uninstall lab-helm-workload -n labs

echo ""
echo "✅ Charts desinstalados com sucesso."