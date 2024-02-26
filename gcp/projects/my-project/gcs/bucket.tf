module "my_bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 4.0"

  name       = "my-bucket"
  project_id = var.project_id
  location   = "us-central1"
  iam_members = [{
    role   = "roles/storage.objectAdmin"
    member = "serviceAccount:${var.my_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  }]
}