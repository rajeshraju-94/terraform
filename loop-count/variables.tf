variable "instance_names" {
    type = list(string)
    default = ["rajesh","hethansh","raju"]
}

variable "common_tags" {
    type = map
    default = {
        Project = "sample"
        Environment = "dev"
    }
}