# Resource Group configurations - ACTUAL VALUES
resource_groups = {
  dev-app-rg = {
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "demo-app"
      managed-by  = "terraform"
    }
  },
}