output "created_branches" {
  value = [for branch in github_branch.create-branch : branch.branch]
}