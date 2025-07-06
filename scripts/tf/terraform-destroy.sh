#!/bin/bash

cd ../../

echo "--- Executando terraform destroy ---"

terraform destroy -var-file="./environments/dev/vultr/terraform.tfvars"