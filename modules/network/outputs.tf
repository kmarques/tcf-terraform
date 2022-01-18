output "default_subnet_id" {
  value= aws_subnet.default.id
}

output "secgroup_allow_web_id" {
  value = aws_security_group.allow_web.id
}

output "secgroup_rds_id" {
  value = aws_security_group.rds.id
}