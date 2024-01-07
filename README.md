# Terraform Beginner Bootcamp 2023

## Semantic Versioning  :mage:

This project is going to utilize semantic versioning for its tagging, 
[semver.org](https://semver.org/)

The general format is : 

**MAJOR.MINOR.PATCH**, e.g `1.0.1`

- __MAJOR__ version when you make incompatible API changes
- __MINOR__ version when you add functionality in a backward compatible manner
- __PATCH__ version when you make backward compatible bug fixes

## Install The Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. so we needed to refer to the latest install CLI.

[Installing Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refactoring Bash Scripts

While fixing the terraform gpg key deprecation, we decided to create a bash script to install terraform.

This bash script is located here: [./bin/install_terraform_cli.sh](./bin/install_terraform_cli.sh)

- This will keep the Gitpod task file tidy ([.gitpod.yml](.gitpod.yml))
- Easier debug than manually terraform install.

## References

- [Linux File Permissions](https://en.wikipedia.org/wiki/File-system_permissions)


- [GIt pod lifecycle](https://www.gitpod.io/docs/configure/workspaces/tasks)