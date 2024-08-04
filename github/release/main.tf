resource "github_release" "release" {
  repository = var.repository_name
  tag_name   = var.tag_name
  draft = false
  name = var.release_name
  body = var.release_body
  prerelease = false
}