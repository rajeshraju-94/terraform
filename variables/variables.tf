/* 
1. command line
 terraform apply -var="image_id=ami-abc123"
 terraform apply -var="instance_type=t3.large"
 terraform apply -var-file="testing.tfvars"
2. terraform.tfvars
instance_type = "t3.small"
3. environment variables, 
export TF_VAR_instance_type=t3.medium
terraform plan
to unset => unset TF_VAR_instance_type
4. default
5. prompt 
*/
variable "from_port" {
  type        = number
  default     = 0
}
variable "to_port" {
  type        = number
  default     = 0
}
variable "protocol" {
    type = string
    default = "tcp"
}
variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}
variable "tags" {
    type = map #optional
    default = {
        Name = "terraform-variable"
        Project = "test"
        Component = "ec2"
        Environment = "DEV"
        Terraform = "true"
    }
}
variable "ami" {
    type = string
    default = "ami-05c179eced2eb9b5b"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "security_group" {
    type = string
    default = "terraform-sg"
}

