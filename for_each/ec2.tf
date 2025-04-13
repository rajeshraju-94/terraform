resource "aws_security_group" "test" {
    name = "test-sg"
    description = "this is sample security group"
    tags = {
        Name = "sample-test"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}
resource "aws_instance" "hethansh" {
    for_each = var.instances # this for each loop
    instance_type = each.value # for each will give special variable "each"
    ami = "ami-05c179eced2eb9b5b"
    vpc_security_group_ids = [aws_security_group.test.id]
    tags = {
        Name = each.key
    }
}