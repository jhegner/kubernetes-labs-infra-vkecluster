echo "✨ Install helm charts via script"

cd ~/Documents/labs/k8s/kubernetes-labs/projetos/kubernetes-labs-infra-vkecluster

export NAMESPACE_LAB="labs"
export NAMESPACE_NEWRELIC="newrelic"

source ~/.bashrc

./scripts/helm/1-namespace.sh
./scripts/helm/2-secrets.sh
./scripts/helm/3-addons.sh
./scripts/helm/4-newrelic.sh
./scripts/helm/5-workload.sh

echo "✨ Ends the install process of helm charts via script"