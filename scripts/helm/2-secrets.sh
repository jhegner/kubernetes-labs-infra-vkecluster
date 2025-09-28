# Install helm charts via script

echo "📜 Deploy helm charts - secrets"

helm upgrade --install lab-helm-secrets ./modules/helm/secrets/ \
--namespace $NAMESPACE_LAB \
--set awsiam-credencial.aws.accessKeyId=$AWS_ACCESS_KEY_ID \
--set awsiam-credencial.aws.secretAccessKey=$AWS_SECRET_ACCESS_KEY \
--set mockapi-project-secret.mockapiProjectSecret=$MOCKAPI_PROJECT_SECRET \
--set newrelic-license-key.newRelicLicenseKey=$NEW_RELIC_LICENSE_KEY

echo "✅ Helm charts instalados com sucesso"

echo "⌛ Aguardando alguns segundos antes da execucao do proximo passo"
sleep 10s