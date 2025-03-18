# 1. command line
# 2. terraform.tfvars
# 3. environment variables, TF_VAR_your_variable_name
# 4. default
# 5. prompt
variable from_port {
  type        = number
  default     = 0
}
variable to_port {
  type        = number
  default     = 0
}
variable protocol {
    type = string
    default = "tcp"
}
variable ingress_cidr {
    type = list(string)
    default = ["0.0.0.0/0"]
}
variable "tags" {
    type = map #optional
    default = {
        Name = "terraform-test"
        Project = "tt"
        Component = "test"
        Environment = "DEV"
        Terraform = "true"
    }
}
variable ami {
    type = string
    default = "ami-05c179eced2eb9b5b"
}
variable instance_type {
    type = string
    default = "t2.micro"
}
variable security_group {
    type = string
    default = "terraform-sg"
}
