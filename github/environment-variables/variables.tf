variable "github_token" {
  description = "Github Fine-grained personal access token"
  type        = string
}

variable "repository_name" {
  description = "The GitHub repository name"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

variable "variables" {
  description = "The name of the variable and value"
  type = list(object({
    name = string
    value = string
  }))
}