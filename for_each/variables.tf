variable "instances" {
    type = map
    default = {
        mysql = "t3.medium"
        frontend = "t3.micro"
        backend = "t3.micro"
    }
}

variable "domain_name" {
  default = "daws-krajesh.online"
}

variable "zone_id" {
  default = "Z03205232RXJZ8K0PKSN2"
}

