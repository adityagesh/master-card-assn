data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_kms_key" "ebs_default" {
  key_id = "alias/aws/ebs"
}
