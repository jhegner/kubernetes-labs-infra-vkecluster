#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "🔧 Kubernetes local port forwarding (minikube)"

kubectl port-forward service/app-micronout-service \
  --address 0.0.0.0 8080:80 \
  -n labs