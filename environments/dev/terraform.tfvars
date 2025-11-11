# Resource Group configurations - ACTUAL VALUES
resource_groups = {
  dev-rg-1 = {
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "dev-app"
      managed-by  = "terraform"
    }
  },
}