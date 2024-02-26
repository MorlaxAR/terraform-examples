module "my_sa" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.0"
  project_id    = var.project_id
  names         = [var.my_sa_name]
  display_name  = "My Service Account"
  project_roles = formatlist("${var.project_id}=>%s", var.my_sa_roles)
}