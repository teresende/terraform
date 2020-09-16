# Terraform

## Some examples around Terraform and Azure Resource Provider

To test some provision example, just clone or download the repository, access the directory you want, and do the follow:

1. Init Terraform on the directory where you will work
        
        terraform init
        

2. Create a plan using the main configuration file to see what will be done before apply 

        terraform plan -out main.tfplan

3. Apply the changes using the plan previously created

        terraform apply main.tfplan



The simplest way to test it is to use the Azure Cloud Shell inside your own subscription in Azure. To use it locally, you need first to install Terraform. Running it from Cloud Shell it will use your login to interact with Azure RM API, when running it locally you need to provide the credentials using *az_login*. For production it is recommended to connect with a [Service Principals](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell#authenticate-via-azure-service-principal).

## Cleaning up
1. First create a plan to see what will excluded
        
        terraform plan -destroy -out main.destroy.tfplan


2. And then, aplly the changes
        
        terraform apply main.destroy.tfplan
