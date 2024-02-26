variable "workspace_domain" {
  type = string
}

variable "my_member_groups" {
  type = map(any)
}

variable "my_group_admins" {
  type = list(string)
}

variable "billing_project" {
  type = string
}
