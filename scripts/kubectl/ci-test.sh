#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "SCRIPT DE TESTE DE CI - REMOVER LOAD BALANCER"

load_balancers_json=$(curl --request GET --url 'https://api.vultr.com/v2/load-balancers' \
            --header "Authorization: Bearer $VULTR_API_KEY")
          
if [ "$(echo "$load_balancers_json" | jq '.load_balancers | length')" -eq 0 ]; then
  echo "😉 Não foi encontrado load balancers provisionados no ambiente."
  exit 0
fi

load_balancer_id=$(echo $load_balancers_json | jq -r '.load_balancers[] | select(.label | contains("kubernetes-labs-service-lb")) | .id')

if [[ -z "$load_balancer_id" ]]; then
  echo "😉 Não foi encontrado load balancer com label 'kubernetes-labs-service-lb'."
  exit 0
fi

echo "✅ Load balancer encontrado"

echo "🔥 Removendo load balancer: $load_balancer_id"

response_code=$(curl --request DELETE -s -o /dev/null -w "%{http_code}" --url "https://api.vultr.com/v2/load-balancers/$load_balancer_id" \
  --header "Authorization: Bearer $VULTR_API_KEY")

echo "response_code: $response_code"

if [ "$response_code" -eq 204 ]; then
  echo "✅ Load balancer removido com sucesso."
  exit 0
else
  echo "❌ Falha ao remover load balancer."
  echo "$delete_response"
  exit 0
fi  