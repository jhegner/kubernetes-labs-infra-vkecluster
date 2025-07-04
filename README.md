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
  - `dev/` and `prod/`: Separate folders for development and production environments.
    - `gcp/` and `vultr/`: Cloud provider-specific subfolders, each containing a `terraform.tfvars` file for environment-specific variables.

- **modules/**  
  Reusable Terraform modules for different infrastructure components.
  - `cloud-network/`: Network resources for each cloud provider.
    - `gcp/` and `vultr/`: Provider-specific network modules.
  - `cluster/`: Module for provisioning Kubernetes clusters.
  - `node-group/`: Module for managing node groups within clusters.
  - `helm-charts/`: Module for deploying Helm charts to the cluster.
  - `addons/`: Module for additional cluster add-ons.

- **scripts/**  
  Utility scripts for local configuration and automation.
  - `config-local.sh`: Script for local environment setup (currently empty).

- **.github/**  
  GitHub configuration files.
  - `PULL_REQUEST_TEMPLATE/`: Templates for pull requests.
  - `workflows/`: GitHub Actions workflows for CI/CD.

## Usage

1. **Configure Environment Variables:**  
   Edit the appropriate `terraform.tfvars` file under `environments/dev/` or `environments/prod/` for your target cloud provider.

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

- [Terraform](https://www.terraform.io/) >= 1.0
- Access credentials for GCP and/or Vultr

