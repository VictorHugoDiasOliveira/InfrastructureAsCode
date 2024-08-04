resource "github_repository_file" "ci_workflow" {
  repository          = var.repository_name
  branch              = var.branch_name
  file                = ".github/workflows/${var.file_name}"
  content             = file("vars/ci_workflow.yml")
  commit_message      = var.commit_message
  overwrite_on_create = true
}