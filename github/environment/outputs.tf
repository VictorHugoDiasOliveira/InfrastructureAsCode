output "environments" {
  value = [for environments in github_repository_environment.repository_environment : environments.environment]
}