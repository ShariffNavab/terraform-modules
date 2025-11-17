variable "resource_groups" {
  description = "Map of resource groups to manage"
  type = map(object({
    location = string
    tags     = map(string)
  }))
}