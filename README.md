## 📁 Repository Structure for New Resources(terraform modules)

```
terraform-modules-repo/
├── 📁 modules/                    # Reusable modules
│   ├── 📁 resource-group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── 📁 storage-account/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── 📁 app-service/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── 📁 sql-database/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── 📁 environments/               # Environment configurations
│   ├── 📁 dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   ├── 📁 qa/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   ├── 📁 prod/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
├── 📁 .github/workflows/          # CI/CD Pipelines
│   ├── terraform-plan-dev.yml
│   ├── terraform-apply-dev.yml
│   ├── terraform-plan-prod.yml
│   └── terraform-apply-prod.yml
├── README.md
└── versions.tf
```