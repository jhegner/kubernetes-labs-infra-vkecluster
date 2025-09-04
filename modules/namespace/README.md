# Namespace principal

A instalação será realizada de forma imperativa na pipeline, por meio de arquivo bash ou instalada manualmente no ambiente local

```
kubectl apply -f ./namespace-labs.yaml
```

ou de forma inline

```
kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: "labs"
  labels:
    projeto: "lab-projeto-1"
spec: {}
status: {}
EOF
```
