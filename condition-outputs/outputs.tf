output "public_ip" {
    value = aws_instance.hethansh.public_ip
    description = "The public IP address of the main server instance."
}