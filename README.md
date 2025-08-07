# kubernetes-labs-infra-cluster

Kubernetes Labs - Infra Cluster

This repository contains Terraform code and supporting scripts to provision and manage Kubernetes infrastructure across multiple cloud providers (GCP and Vultr) for both development and production environments.

## Repository Structure

### Top-level configuration files

- **main.tf**: The primary Terraform configuration file. It defines the main resources, modules, and orchestrates the overall infrastructure setup.
- **providers.tf**: Specifies the cloud providers (such as GCP and Vultr) and their required configurations for Terraform to interact with them.
- **backend.tf**: Configures the backend for storing Terraform state remotely, ensuring state consistency and collaboration.
- **data.tf**: Contains data sources used to fetch information from providers or other resources, which can be referenced elsewhere in the configuration.

### Folders

- **environments/**  
  Contains environment-specific variable definitions for different deployment targets.
  - `tfvars` file for environment-specific variables.

- **modules/**  
  Reusable Terraform modules for different infrastructure components.
  - `cluster/`: Module for provisioning Kubernetes clusters.
  - `helm-charts/`: Module for deploying Helm charts to the cluster.

- **scripts/**  
  - Utility scripts for local configuration and automation.

- **.github/**  
  GitHub configuration files.
  - `PULL_REQUEST_TEMPLATE/`: Templates for pull requests.
  - `workflows/`: GitHub Actions workflows for CI/CD.

## Usage - local

1. **Configure Environment Variables:**  
   Edit the appropriate `terraform.tfvars` file under `environments`

2. **Initialize Terraform:**  
   ```sh
   terraform init
   ```

3. **Plan and Apply:**  
   ```sh
   terraform plan -var-file=environments/<env>/<provider>/terraform.tfvars
   terraform apply -var-file=environments/<env>/<provider>/terraform.tfvars
   ```

## Requirements

- Access credentials for GCP and/or Vultr