# ☸️ Axion AKS Infrastructure

Production-style Azure Kubernetes Service (AKS) infrastructure built using **Terraform** with reusable modules.

This project focuses on provisioning the core Azure infrastructure required for an AKS environment while following a modular Infrastructure as Code (IaC) approach.

## 🎯 Project Overview

The infrastructure is designed to provision:

- Azure Resource Group
- Virtual Network
- Dedicated AKS Subnet
- Azure Kubernetes Service (AKS) Cluster
- System-assigned Managed Identity
- Azure CNI based cluster networking

Terraform code is separated into reusable modules, while environment-specific configuration is maintained under the `environments` directory.

## 🏗️ Architecture

The infrastructure follows a simple modular design where Terraform provisions the Azure resources required for the AKS cluster.

```text
Azure Subscription
        │
        ▼
Resource Group
        │
        ▼
Virtual Network
        │
        ▼
Dedicated AKS Subnet
        │
        ▼
Azure Kubernetes Service (AKS)
        │
        ├── Default Node Pool
        │
        ├── System-Assigned Managed Identity
        │
        └── Azure CNI Networking
```
## 🚀 Deployment

Navigate to the development environment:

```bash
cd environments/dev
```

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review the infrastructure changes:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

To remove the deployed infrastructure:

```bash
terraform destroy
```
## 📋 Prerequisites

Before deploying the infrastructure, make sure you have:

- An active Azure subscription
- Terraform installed
- Azure CLI installed
- Azure CLI authenticated using `az login`

## 🛠️ Tech Stack

`Microsoft Azure` `Terraform` `AKS` `Azure CNI` `Git` `GitHub`
