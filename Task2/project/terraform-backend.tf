resource "aws_s3_bucket" "terraform_state"{
    bucket = "sprints-remote-statefile"
    lifecycle {
        prevent_destroy = false
  } 
}



resource "aws_dynamodb_table" "terraform_locks" {
    name = "sprints-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}