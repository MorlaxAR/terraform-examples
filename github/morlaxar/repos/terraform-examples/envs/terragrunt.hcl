include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

inputs = merge(
  read_terragrunt_config(find_in_parent_folders("repo.hcl")).inputs,
  read_terragrunt_config(find_in_parent_folders("user.hcl")).inputs,
  {
    env_vars = {
      ENV_1 = "value_1"
      ENV_2 = "value_2"
      ENV_3 = "value_3"
    }
  }
)
