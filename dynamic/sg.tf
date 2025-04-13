resource "aws_security_group" "dynamic" {
    name = "dynamic-demo"
    description = "this is sample security group"
    tags = {
        Name = "sample-test"
    }
    # terraform dynamic block
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value.to_port
            protocol = ingress.value["protocol"] # this way also we can give
            cidr_blocks      = ingress.value.cidr_blocks # we can give . as well to refer
        }
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}