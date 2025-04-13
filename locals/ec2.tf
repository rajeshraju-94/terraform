resource "aws_instance" "expense" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.amazon-linux.image_id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.sample.id]
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_security_group" "sample" {
  name        = "terraform-sg"
  description = "allow all IPs for 22 port"
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
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
  tags = {
    Name = "terraform-sg"
  }
}