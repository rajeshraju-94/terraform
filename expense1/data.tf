data "aws_ami" "amazon-linux" {
  # this is for fetching default ami of the aws which is used most recently
  most_recent = true
  filter {
    name   = "description"
    values = ["Amazon Linux 2023 AMI 2023.7.20250331.0 x86_64 HVM kernel-6.1"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"]
}