resource "aws_amplify_app" "amplify_app" {
  name = var.app_name
  repository = var.repository_url
  platform = "WEB"
  access_token    = var.github_token
}