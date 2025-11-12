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