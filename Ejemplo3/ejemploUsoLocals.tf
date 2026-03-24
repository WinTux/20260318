locals {
  un_tag = "un-tag"
}

resource "aws_instance" "algo" {
  ...
  tags = {
    AlgunTag = local.un_tag
  }
}
