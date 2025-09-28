# Install helm charts via script

echo "📜 Deploy helm charts - addons"

helm repo add cert-manager https://charts.jetstack.io
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm dependency build ./modules/helm/addons/

helm upgrade --install lab-helm-addons ./modules/helm/addons/ \
    --namespace $NAMESPACE_LAB \
    --set installCRDs=true

echo "✅ Helm charts instalados com sucesso"

echo "⌛ Aguardando alguns segundos antes da execucao do proximo passo"
sleep 10s