terraform {
  backend "s3" {
    bucket         = "tf-state-articos"                         # nombre exacto del bucket S3 que creaste
    key            = "infra-terraform/dev/terraform.tfstate"        # ruta única por proyecto y entorno
    region         = "us-east-1"                               # región donde está el bucket
    dynamodb_table = "tfstate-locks"                           # nombre exacto de la tabla DynamoDB
    encrypt        = true
  }
}
