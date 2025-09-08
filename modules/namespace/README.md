# Namespace principal

A instalação será realizada de forma imperativa na pipeline, por meio de arquivo bash ou instalada manualmente no ambiente local

```
kubectl apply -f ./namespace.yaml
```

ou de forma inline

```
kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: "labs"
  labels:
    app.kubernetes.io/managed-by: "Helm"
    kubernetes.io/metadata.name: "labs"
    projeto: "lab-projeto-1"
#  annotations:
#    meta.helm.sh/release-name: "lab-infra-workload" # necessario para referenciar no helm
#    meta.helm.sh/release-namespace: "labs" # necessario para referenciar no helm
spec: {}
status: {}
EOF
```
