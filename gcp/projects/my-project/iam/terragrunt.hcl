include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

inputs = merge(
  read_terragrunt_config(find_in_parent_folders("global.hcl")).inputs,
  read_terragrunt_config(find_in_parent_folders("project.hcl")).inputs,
  {
    my_sa_roles = [
        "roles/iam.serviceAccountUser"
        "roles/datastore.user"
    ]
  }
)