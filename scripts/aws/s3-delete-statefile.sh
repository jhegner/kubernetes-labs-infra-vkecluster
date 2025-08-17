#!/bin/bash

cd ../../

echo "--- Removendo o arquivo terraform de estado da infra vultr ---"

aws s3 rm s3://kubernetes-labs-tf-backend-aws-s3bucket/lab/state/tf-infra-vkecluster
aws s3 rm s3://kubernetes-labs-tf-backend-aws-s3bucket/lab/state/tf-infra-vkecluster.tflock