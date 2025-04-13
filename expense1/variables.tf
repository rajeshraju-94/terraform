variable "instance_names" {
  type    = list(string)
  default = ["frontend", "backend", "mysql"]
}

variable "domain_name" {
  default = "daws-krajesh.online"
}

variable "zone_id" {
  default = "Z03205232RXJZ8K0PKSN2"
}
