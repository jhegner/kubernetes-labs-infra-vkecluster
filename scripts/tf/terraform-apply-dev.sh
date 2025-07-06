#!/bin/bash

cd ../../

echo "--- Executando terraform apply "tfplan" ---"

terraform validate
terraform plan -var-file="./environments/dev/vultr/terraform.tfvars" -out=tfplan
terraform apply "tfplan"