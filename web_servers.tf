/*
__          __  _        _____                           __ __  
\ \        / / | |      / ____|                         / / \ \ 
 \ \  /\  / /__| |__   | (___   ___ _ ____   _____ _ __| |___| |
  \ \/  \/ / _ \ '_ \   \___ \ / _ \ '__\ \ / / _ \ '__| / __| |
   \  /\  /  __/ |_) |  ____) |  __/ |   \ V /  __/ |  | \__ \ |
    \/  \/ \___|_.__/  |_____/ \___|_|    \_/ \___|_|  | |___/ |
                                                        \_\ /_/ 

                                                              */

data "template_file" "user_data" {
  template = file("user_data.tpl")
}

module "web-servers" {

  source = "./../terraform-aws-ec2-module"
  //source = "john-morsley/ec2/aws"

  count = var.number_of_web_servers
  
  name = "${local.name}-${count.index}"

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.web_server_instance_type

  vpc_id = module.vpc.id

  public_subnet_id = module.vpc.public_subnet_ids[0]

  availability_zone = data.aws_availability_zones.available.names[0]

  bucket_prefix = var.domain
  
  user_data = data.template_file.user_data.rendered
  
  additional_security_group_ids = [
    module.allow-web-traffic-sg.id
    //aws_security_group.allow_tls.id
  ]
  
}