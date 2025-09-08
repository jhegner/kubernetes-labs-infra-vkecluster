#!/usr/bin/env bash
set -euo pipefail

# set -euo pipefail - torna a execução mais segura e previsível
# -e: pare no primeiro erro
# -u: erro se variável não estiver definida
# -o pipefail: detecta falha em qualquer parte do pipeline

echo "🔥 Desinstalando os CRDs do External Secrets Operator"
echo ""

kubectl delete crd acraccesstokens.generators.external-secrets.io
kubectl delete crd clusterexternalsecrets.external-secrets.io
kubectl delete crd clustergenerators.generators.external-secrets.io
kubectl delete crd clusterpushsecrets.external-secrets.io
kubectl delete crd clustersecretstores.external-secrets.io
kubectl delete crd ecrauthorizationtokens.generators.external-secrets.io
kubectl delete crd externalsecrets.external-secrets.io
kubectl delete crd fakes.generators.external-secrets.io
kubectl delete crd gcraccesstokens.generators.external-secrets.io
kubectl delete crd generatorstates.generators.external-secrets.io
kubectl delete crd githubaccesstokens.generators.external-secrets.io
kubectl delete crd grafanas.generators.external-secrets.io
kubectl delete crd mfas.generators.external-secrets.io
kubectl delete crd passwords.generators.external-secrets.io
kubectl delete crd pushsecrets.external-secrets.io
kubectl delete crd quayaccesstokens.generators.external-secrets.io
kubectl delete crd secretstores.external-secrets.io
kubectl delete crd sshkeys.generators.external-secrets.io
kubectl delete crd stssessiontokens.generators.external-secrets.io
kubectl delete crd uuids.generators.external-secrets.io
kubectl delete crd vaultdynamicsecrets.generators.external-secrets.io
kubectl delete crd webhooks.generators.external-secrets.io

echo ""
echo "✅ CRDs do External Secrets Operator desinstalados com sucesso."