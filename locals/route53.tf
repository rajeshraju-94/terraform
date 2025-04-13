resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  #backend.daws-krajesh.online
  zone_id = local.zone_id
  /*
  if true daws-krajesh.online and when false backend.daws-krajesh.online
  and mysql.daws-krajesh.online

  this is interpolation using .

 var.domain_name :  "${var.instance_names[count.index]}.${var.domain_name}"

  */
  name            = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}"
  type            = "A"
  ttl             = 1
  records         = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}