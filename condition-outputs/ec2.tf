
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
    # simple condition using variable environment
    instance_type = var.environment == "dev" ? "t3.small" : "t3.micro"
    tags = {
        Name = "sample instance"
    }
    ami = "ami-05c179eced2eb9b5b"
    vpc_security_group_ids = [aws_security_group.test.id]
}