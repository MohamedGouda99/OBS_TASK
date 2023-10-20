# Resource ECR Caleed ngnix-app for storing images
resource "aws_ecr_repository" "foo1" {
  name                 = "nginx-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}



