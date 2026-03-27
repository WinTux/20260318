output "ip_addr_instancia" {
  #value = aws_instance.mi_servidor.private_ip
  value = { for servicio, i in aws_instance.mi_servidor : servicio => i.private_ip }
}
output "ip_para_nginx" {
  value = { for servicio, i in aws_instance.mi_servidor : servicio => i.public_ip }
}
