#: Title : terraform
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : texto sobre terraform
#: Options :

# credencial de acesso a AWS
$ mkdir /Users/cosmo/.aws
$ vi /Users/cosmo/.aws/credentials
	[cferreira]
	aws_access_key_id = "xxxxxxxxxxxxxxxxxxx"
	aws_secret_access_key = "xxx/xxxxxxxxxxxxx/xxxx"

# diretorio de trabalho
$ cd /Users/cosmo/myprojects/devops/terraform/src
$ vi instance.tf

# Initialize a Terraform working directory
$ terraform init

# Generate and show an execution plan
$ terraform plan

# Builds or changes infrastructure 
$ terraform apply

# Destroy Terraform-managed infrastructure
$ terraform destroy

# Inspect Terraform state or plan
$ terraform show

# Generate and show an execution plan
$ terraform plan

# Builds or changes infrastructure 
$ terraform apply