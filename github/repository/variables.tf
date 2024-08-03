variable "github_token" {
  description = "Github Fine-grained personal access token"
  type        = string
}

variable "repository_name" {
  description = "The GitHub repository name"
  type        = string
}

variable "repository_description" {
  description = "A description of the repository."
  type        = string
}

variable "repository_visibility" {
  description = "Can be public or private"
  type        = string
}

variable "git_ignore_template" {
  description = "Use the name of the template without the extension. For example: Go."
  type        = string
}