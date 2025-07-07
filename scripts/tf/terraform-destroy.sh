#!/bin/bash

cd ../../

echo "--- Executando terraform destroy ---"

terraform destroy -var-file="./environments/vultr/terraform.tfvars" -auto-approve