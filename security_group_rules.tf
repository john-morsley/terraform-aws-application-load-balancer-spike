/*
  _____                      _ _            _____                         _____       _       __ __  
 / ____|                    (_) |          / ____|                       |  __ \     | |     / / \ \ 
| (___   ___  ___ _   _ _ __ _| |_ _   _  | |  __ _ __ ___  _   _ _ __   | |__) |   _| | ___| |___| |
 \___ \ / _ \/ __| | | | '__| | __| | | | | | |_ | '__/ _ \| | | | '_ \  |  _  / | | | |/ _ \ / __| |
 ____) |  __/ (__| |_| | |  | | |_| |_| | | |__| | | | (_) | |_| | |_) | | | \ \ |_| | |  __/ \__ \ |
|_____/ \___|\___|\__,_|_|  |_|\__|\__, |  \_____|_|  \___/ \__,_| .__/  |_|  \_\__,_|_|\___| |___/ |
                                    __/ |                        | |                         \_\ /_/ 
                                   |___/                         |_|                                 
								                                                                   */
module "allow-http-ingress-sgr" {

  source = "./../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "HTTP Ingress."

  security_group_id = module.allow-web-traffic-sg.id

  type      = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidrs     = ["0.0.0.0/0"]

}

module "allow-https-ingress-sgr" {

  source = "./../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "HTTPS Ingress."

  security_group_id = module.allow-web-traffic-sg.id

  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidrs     = ["0.0.0.0/0"]

}

module "allow-http-egress-sgr" {

  source = "./../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "Egress for HTTP."

  security_group_id = module.allow-web-traffic-sg.id

  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  cidrs     = ["0.0.0.0/0"]

}