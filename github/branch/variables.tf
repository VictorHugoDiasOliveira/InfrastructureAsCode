variable "github_token" {
  description = "Github Fine-grained personal access token"
  type        = string
}

variable "repository_name" {
  description = "The GitHub repository name."
  type        = string
}

variable "repository_branch" {
  description = "The repository branch to create."
  type        = list(string)
}