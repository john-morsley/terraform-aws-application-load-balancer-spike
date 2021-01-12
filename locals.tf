locals {
  
  alb_address = "${var.sub_domain}.${var.domain}"

  name = "${var.web_server_name}-${random_pet.name.id}"
  
}