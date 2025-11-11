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
  dev-app-rg-2 = {
    location = "southindia"
    tags = {
      environment = "dev"
      project     = "demo-2-app"
      managed-by  = "terraform"
    }
  },
}