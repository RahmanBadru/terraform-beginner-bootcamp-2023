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

### Working Env Vars

#### env command

We can list out all Environment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world'`

In the terminal we unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```

Within a bash script we can set env without writing export e.g

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing env vars

We can print an env var using echo e.g `echo $HELLO`


##### Scoping of env vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. e.g  `.bash_profile`

##### Persisting env vars in gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set envars in the `.gitpod.yml` but this can only contain non-sensitive env vars


### AWS CLI INSTALLATION

Aws cli is installed for the project via the bash script [`./bin/install_aws_cli.sh`](./bin/install_aws_cli.sh)

[Getting started install with (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI ENV VARS](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running this command

```sh
aws sts get-caller-identity
```

if it is successful, you should see something like this:

```json
{
    "UserId": "AIDCYIKN2KAIBFA4PFE6Y",
    "Account": "12237767",
    "Arn": "arn:aws:iam::12237767:user/Terraform-user"
}
```

We'll need to generate AWS Credentials for IAM USer in order to use aws cli