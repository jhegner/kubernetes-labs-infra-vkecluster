echo "🔨 cert-manager: instalando CustomResourceDefinition resources..."

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.18.2/cert-manager.crds.yaml

echo "🟢 cert-manager: CRDs instalado com sucesso"