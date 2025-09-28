# Install helm charts via script

echo "📜 Deploy helm charts - workload"

helm upgrade --install lab-helm-workload ./modules/helm/workload/ \
    --namespace $NAMESPACE_LAB \
    --set installCRDs=true \
    --set mockapi-project-secret.mockapiProjectSecret=$MOCKAPI_PROJECT_SECRET

echo "✅ Helm charts instalados com sucesso"

echo "⌛ Aguardando alguns segundos antes da execucao do proximo passo"
sleep 10s