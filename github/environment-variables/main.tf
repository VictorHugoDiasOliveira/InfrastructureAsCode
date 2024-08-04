resource "github_actions_environment_variable" "action_environment_variable" {
  repository  = var.repository_name
  environment = var.environment_name

  for_each = {
    for index, variables in var.variables :
    variables.name => variables
  }

  variable_name = each.value.name
  value         = each.value.value
}