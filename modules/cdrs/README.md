# Recomendação de instalar os CDRs separados

A instalação será realizada de forma imperativa na pipeline, por meio de arquivo bash ou instalada manualmente no ambiente local

```
kubectl apply -f "https://raw.githubusercontent.com/external-secrets/external-secrets/v0.19.2/deploy/crds/bundle.yaml" --server-side
```

### Remove todos cdrs criados

> CDRs do external-secrets

```
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
```
