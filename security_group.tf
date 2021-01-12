/*															  
  _____                      _ _            _____                       
 / ____|                    (_) |          / ____|                      
| (___   ___  ___ _   _ _ __ _| |_ _   _  | |  __ _ __ ___  _   _ _ __  
 \___ \ / _ \/ __| | | | '__| | __| | | | | | |_ | '__/ _ \| | | | '_ \ 
 ____) |  __/ (__| |_| | |  | | |_| |_| | | |__| | | | (_) | |_| | |_) |
|_____/ \___|\___|\__,_|_|  |_|\__|\__, |  \_____|_|  \___/ \__,_| .__/ 
                                    __/ |                        | |    
                                   |___/                         |_|  */

module "allow-web-traffic-sg" {

  source = "./../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  name        = "${var.web_server_name}-allow-web-traffic-sg"
  description = "Allow Web Traffic."

  vpc_id = module.vpc.id
  
}