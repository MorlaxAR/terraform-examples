provider "google-beta" {
  user_project_override = true
  billing_project       = var.billing_project
}

module "my_parent_group" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  id           = "my-group@${var.workspace_domain}"
  display_name = "my-group"
  description  = "My Parent Group. Managed with Terraform, DO NOT EDIT MANUALLY"
  domain       = var.workspace_domain
  owners       = formatlist("%s@${var.workspace_domain}", var.my_group_admins)
  managers     = []
  members      = values(module.my_child_groups)[*].id
}

module "my_child_groups" {
  for_each = var.my_member_groups

  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"

  id           = "${each.key}@${var.workspace_domain}"
  display_name = each.key
  description  = "Child Group. Managed with Terraform, DO NOT EDIT MANUALLY"
  domain       = var.workspace_domain
  owners       = formatlist("%s@${var.workspace_domain}", var.my_group_admins)
  managers     = []
  members      = formatlist("%s@${var.workspace_domain}", each.value.members)
}