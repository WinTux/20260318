variable "aws_region" {
  type      = string
  default   = "us-east-1"
  sensitive = true
}

variable "nombres_servicios" {
  description = "Nombre de los repositorios de EC2"
  type        = set(string)
}
