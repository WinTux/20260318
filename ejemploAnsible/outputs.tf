output "ip_de_spring" {
  value = { for servicio, i in aws_instance.mi_servidor : servicio => i.public_ip }
}
