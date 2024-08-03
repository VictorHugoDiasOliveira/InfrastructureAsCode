resource "github_branch" "create-branch" {
  repository = var.repository_name

  for_each = {
    for index, branch in var.repository_branch :
    branch => branch
  }

  branch = each.value
}

resource "github_branch_protection" "development_protection" {
  repository_id = var.repository_name # also accepts repository name

  for_each = {
    for index, branch in var.repository_branch :
    branch => branch
  }

  pattern          = each.value
  enforce_admins   = true
  allows_deletions = true

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews  = true
    restrict_dismissals    = true
    required_approving_review_count = 2
    require_last_push_approval = false
  }
}