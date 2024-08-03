# Terraform Snippets Collection

This repository contains a collection of ready-to-use Terraform snippets designed to facilitate the creation and management of infrastructure on AWS, GitHub, and other platforms. Each snippet is modular and reusable, allowing for quick and efficient implementation.

## Objectives

- Simplify AWS infrastructure configuration
- Automate the creation of repositories and workflows on GitHub
- Provide practical, tested examples of Terraform configurations

## Contents

- Configurations for creating and managing AWS resources
- Automation of repositories and pipelines on GitHub
- Examples of integrations with other platforms

## How to Use

1. Clone the repository:
2. Navigate to the directory of the desired snippet.
3. Create a folder named vars and a new file named vars.tfvars and assign values to the variables defined in variables.tf.
4. Initialize and apply the configuration:
```
terraform init
terraform apply --var-file=vars/vars.tfvars
```

## GitHub Provider Note

Due to an unknown issue, the GitHub provider modules could not be utilized. As a result, there are no modules for the GitHub configurations in this repository. We recommend manually configuring the necessary variables and resources as needed.