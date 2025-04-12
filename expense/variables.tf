variable "instance_names" {
    type = list(string)
    default = ["frontend","backend","mysql"]
}

variable "common_tags" {
    type = map
    default = {
        Project = "sample"
        Environment = "dev"
    }
}
variable "zone_id" {
    default = "Z03205232RXJZ8K0PKSN2"
}
variable "domain_name" {
    default = "daws-krajesh.online"
}