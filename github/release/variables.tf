variable "github_token" {
  description = "Github Fine-grained personal access token"
  type        = string
}

variable "repository_name" {
  description = "The GitHub repository name"
  type        = string
}

variable "tag_name" {
  description = "The name of the tag"
  type        = string
}

variable "release_name" {
  description = "The name of the release"
  type        = string
}

variable "release_body" {
  description = "Text describing the contents of the tag"
  type        = string
}