# Install helm charts via script

echo "📜 Deploy helm charts - newrelic"

helm dependency build ./modules/helm/newrelic/

helm upgrade --install newrelic-bundle ./modules/helm/newrelic/ \
    --namespace $NAMESPACE_NEWRELIC \
    --set installCRDs=true \
    --set global.licenseKey=$NEW_RELIC_LICENSE_KEY

echo "✅ Helm charts instalados com sucesso"

echo "⌛ Aguardando alguns segundos antes da execucao do proximo passo"
sleep 10s