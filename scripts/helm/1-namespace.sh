# Install helm charts via script

echo "🔧 Deploy manual manifestos para setup"

# Namespace labs
chmod +x ./modules/namespace/*.sh && \
./modules/namespace/install.sh           

# CRDs
chmod +x ./modules/crds/*.sh && \
./modules/crds/install.sh

echo "⌛ Aguardando alguns segundos antes da execucao do proximo passo"
sleep 10s