resource "github_actions_environment_secret" "action_environment_secret" {
  repository  = var.repository_name
  environment = var.environment_name

  for_each = {
    for index, secrets in var.secrets :
    secrets.name => secrets
  }

  secret_name     = each.value.name
  plaintext_value = each.value.value
  # encrypted_value = "value_encrypted" # Encrypted value of the secret using the GitHub public key in Base64 format.
}