### Steps to run terraform module
# Please update terraform.tfvars file with your own variable values (profile, region ...)

 #Initialize terraform module
terraform init

# Plan terraform module before applying
terraform plan

# Apply terraform script
terraform apply

# Destroy terraform infrastructure after testing
terraform destroy

## Key pair for nginx ec2 instance will be created with the name of linux-key-pair.pem (incase you want to ssh into server for troubleshooting purposes)

## The nginx server ip will be written into url.md file automaticaly after terraform apply