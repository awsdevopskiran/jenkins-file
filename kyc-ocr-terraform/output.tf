# output "instance_ip_addr" {
#   value = length(aws_instance.redis-vm) > 0 ? aws_instance.redis-vm[0].private_ip : ""
# }


output "private_subnet_id" {
  value = length(aws_subnet.private_subnet) > 0 ? aws_subnet.private_subnet[0].id : " "
  # value = var.subnet_id > 0 ? aws_subnet.private_subnet[0].id : " "
  # value = aws_subnet.private_subnet[0].id
 }

# output "private_subnet_id" {
#   # value = var.demo-2 ? aws_subnet.private_subnet.0.id : null
#   value = var.redis ? try(aws_subnet.private_subnet[0].id, null) : " "
# }

output "instance_ip_addr" {
  # value = length(aws_instance.demo-2) > 0 ? aws_instance.demo-2[0].private_ip : " "
  # value = var.demo-2 ? aws_instance.demo-2.0.private_ip : null
  value = var.redis ? try(aws_instance.demo-2[0].private_ip, null) : " "
  # value = try(aws_instance.demo-2[0].private_ip, " ")
  # value = aws_instance.demo-2[0].private_ip
}



