resource "github_repository_environment" "repository_environment" {
  repository = var.repository_name

  for_each = {
    for index, environment in var.environment_name :
    environment => environment
  }
  environment       = each.value
  can_admins_bypass = true
}
