# 📁 Terraform Module Structure

```
terraform-modules-repo/
├── 📁 modules/                    # Reusable modules
│   ├── 📁 resource-groups/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── 📁 storage-accounts/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── 📁 virtual-machines/
│   │   ├── main.tf
│   │   ├── variables.tf          
│   │   └── outputs.tf            
│   └── 📁 virtual-network/
│       ├── main.tf
│       ├── variables.tf          
│       └── outputs.tf            
├── 📁 environments/               # Environment configurations
│   ├── 📁 dev/                   
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── 📁 qa/                    
│   │   ├── provider.tf
│   │   ├── main.tf               
│   │   ├── variables.tf          
│   │   ├── outputs.tf            
│   │   ├── terraform.tfvars      
│   │   └── backend.tf            
│   ├── 📁 uat/                   
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   ├── backend.tf
│   │   └── provider.tf
│   └── 📁 prod/                  
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       ├── backend.tf
│       └── provider.tf
├── 📁 .github/workflows/         # CI/CD Pipelines
│   ├── terraform-plan-dev.yml    
│   ├── terraform-apply-dev.yml   
│   ├── terraform-destroy-dev.yml 
│   ├── terraform-plan-qa.yml     
│   ├── terraform-apply-qa.yml    
│   ├── terraform-plan-prod.yml   
│   └── terraform-apply-prod.yml  
├── README.md
└── versions.tf
```

# Terraform Import

## rg

```
az group create --resource-group qa-rg -l southindia
```

```
terraform import 'module.resource_groups.azurerm_resource_group.rgs["qa-rg"]' /subscriptions/d9577420-7ac0-4876-9eb6-0e57cc547348/resourceGroups/qa-rg
```

## Sa

```
az storage account create \
  --name shariffsiaccount \
  --resource-group dev-rg \
  --location southindia \
  --sku Standard_LRS
```

```
az storage account show --name shariffsiaccount --resource-group dev-rg --query id -o tsv
```

```
terraform import 'module.storage_accounts.azurerm_storage_account.storage["shariffsiaccount"]' /subscriptions/d9577420-7ac0-4876-9eb6-0e57cc547348/resourceGroups/dev-rg/providers/Microsoft.Storage/storageAccounts/shariffsiaccount
```

## containers

```
for c in cont1 cont2
do
  az storage container create --name $c --account-name shariffsiaccount
done
```

```
terraform import 'module.storage_accounts.azurerm_storage_container.containers["shariffsiaccount_cont1"]' "/subscriptions/$(az account show --query id -o tsv)/resourceGroups/dev-rg/providers/Microsoft.Storage/storageAccounts/shariffsiaccount/blobServices/default/containers/cont1"
```
```
terraform import 'module.storage_accounts.azurerm_storage_container.containers["shariffsiaccount_cont2"]' "/subscriptions/$(az account show --query id -o tsv)/resourceGroups/dev-rg/providers/Microsoft.Storage/storageAccounts/shariffsiaccount/blobServices/default/containers/cont2"
```

## trouble shoot

### Rename existing containers in state (NO DESTRUCTION)

```
terraform state mv 'module.storage_accounts.azurerm_storage_container.containers["cont1"]' 'module.storage_accounts.azurerm_storage_container.containers["shariffciaccount_cont1"]'
```
```
terraform state mv 'module.storage_accounts.azurerm_storage_container.containers["cont2"]' 'module.storage_accounts.azurerm_storage_container.containers["shariffciaccount_cont2"]'
```