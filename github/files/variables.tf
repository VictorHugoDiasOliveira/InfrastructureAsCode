variable "github_token" {
  description = "Github Fine-grained personal access token"
  type        = string
}

variable "repository_name" {
  description = "The GitHub repository name"
  type        = string
}

variable "branch_name" {
  description = "The GitHub repository name"
  type        = string
}

variable "file_name" {
  description = "The GitHub repository name"
  type        = string
}

variable "commit_message" {
  description = "The commit message when creating, updating or deleting the managed file"
  type        = string
}