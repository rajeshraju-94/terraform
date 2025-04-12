
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
    # simple loop using count, it will create 3 instances with name "count-instance"
    # count = 3
    count = length(var.instance_names)
    instance_type = "t3.micro"
    # simple loop using count index, it will create 3 instances with names in variable "instance_names"
    # tags = {
    #     Name = var.instance_names[count.index]
    # }
    tags = merge (
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        } 
    )
    ami = "ami-05c179eced2eb9b5b"
    vpc_security_group_ids = [aws_security_group.test.id]
}