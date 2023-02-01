# AWS-Terraform-Templates
Terraform automation templates for AWS cloud provicer.

## AWS

Before starting with Terraform it is neccessary to configure your credentials in the AWS folder in your system.

For that, the best thing is to install the AWS CLI (In Linux):

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
Once the AWS CLI is installed, run the following command to configure the values for the `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and the default `REGION`.

```bash
aws configure
```

## TERRAFORM

In each directory that contains a `main.tf` file, remember to run a `terraform init` command.

```bash
terraform init
terraform plan
terraform apply
```
`terraform plan` will show you the changes that are going to be deployed and `terraform apply` push thouse changes in to the cloud environment.

If you want to see the dependency graph you can use this command:

```bash
terraform graph
```

### Clean Up

```bash
terraform destroy
```
