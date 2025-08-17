variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default = ""
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default = ""
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-08a6efd148b1f7504"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "NewS3Bucket" {
  description = "Name of the new S3 bucket"
  type        = string
  default     = "my-new-s3-bucket-rahul007"
}
