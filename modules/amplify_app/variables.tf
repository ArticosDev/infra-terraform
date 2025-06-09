variable "app_name" {
  description = "Nombre de la aplicación Amplify"
  type        = string
}

variable "repository_url" {
  description = "URL del repositorio de código fuente (GitHub, GitLab, etc.)"
  type        = string
}

variable "github_token" {
  description = "Token de GitHub para acceso al repositorio privado"
  type        = string
}