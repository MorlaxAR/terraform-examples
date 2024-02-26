include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

inputs = merge(
  read_terragrunt_config(find_in_parent_folders("global.hcl")).inputs,
  {
    billing_project = "my-project-id"
    my_member_groups = {
      my-child-group-1 : {
        members = []
      },
      my-child-group-2 : {
        members = [
            "john.doe",
            "jane.smith"
        ]
      },
    my_group_admins = [
      "harry.jones",
    ]
    }
  }
)
