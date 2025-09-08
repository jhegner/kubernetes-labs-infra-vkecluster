#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "Nao há CRDs para instalar neste momento."

# Exemplo de instalação de CRD:
# kubectl apply -f https://example.com/path/to/crd.yaml
# kubectl wait --for=condition=established --timeout=60s crd/myresources.example.com
# kubectl get crd myresources.example.com
# echo "CRD 'myresources.example.com' instalada com sucesso."

# Adicione aqui outros comandos de instalação de CRDs conforme necessário.