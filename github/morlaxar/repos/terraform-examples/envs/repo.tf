data "github_repository" "repo" {
  full_name = "${var.user_name}/${var.repo_name}"
}
