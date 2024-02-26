resource "github_actions_variable" "env_vars" {
  for_each      = var.env_vars
  repository    = data.github_repository.repo.name
  variable_name = each.key
  value         = each.value
}
