resource "github_repository" "create" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = var.repository_visibility

  vulnerability_alerts = true

  # Generate
  auto_init          = true
  gitignore_template = var.git_ignore_template

  # General - General
  is_template = true
  web_commit_signoff_required = false

  # General - Features
  has_wiki        = false
  has_issues      = false
  has_discussions = false

  # General - Pull Requests
  allow_rebase_merge     = true
  allow_update_branch    = true
  allow_auto_merge       = false
  delete_branch_on_merge = false

  # If you want to use a template you can use the following code
  # template {
  #   owner                = "owner" # user or company
  #   repository           = "repository_name"  # repository to copy
  #   include_all_branches = true
  # }
}