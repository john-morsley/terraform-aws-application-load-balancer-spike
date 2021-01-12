/*                    _ _           _   _               _                     _   ____        _                           
    /\               | (_)         | | (_)             | |                   | | |  _ \      | |                          
   /  \   _ __  _ __ | |_  ___ __ _| |_ _  ___  _ __   | |     ___   __ _  __| | | |_) | __ _| | __ _ _ __   ___ ___ _ __ 
  / /\ \ | '_ \| '_ \| | |/ __/ _` | __| |/ _ \| '_ \  | |    / _ \ / _` |/ _` | |  _ < / _` | |/ _` | '_ \ / __/ _ \ '__|
 / ____ \| |_) | |_) | | | (_| (_| | |_| | (_) | | | | | |___| (_) | (_| | (_| | | |_) | (_| | | (_| | | | | (_|  __/ |   
/_/    \_\ .__/| .__/|_|_|\___\__,_|\__|_|\___/|_| |_| |______\___/ \__,_|\__,_| |____/ \__,_|_|\__,_|_| |_|\___\___|_|   
         | |   | |                                                                                                        
         |_|   |_|                                                                                                      */

########################################################################################################################
# 1 - CREATE THE LOAD BALANCER 
########################################################################################################################

# https://www.terraform.io/docs/providers/aws/r/lb.html

resource "aws_lb" "this" {

  name                             = var.load_balancer_name
  internal                         = false
  load_balancer_type               = "application"
  subnets                          = module.vpc.public_subnet_ids
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false
  
  security_groups = [module.allow-web-traffic-sg.id]
  
}

########################################################################################################################
# 2 - CREATE THE TARGET GROUPS
########################################################################################################################

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

resource "aws_lb_target_group" "http" {

  name     = var.http_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.id

}

//resource "aws_lb_target_group" "https" {
//  
//  name     = var.https_target_group_name
//  port     = 443
//  protocol = "HTTPS"
//  vpc_id   = module.vpc.id
//  
//}

########################################################################################################################
# 3 - CREATE THE LISTENERS
########################################################################################################################

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }

//  default_action {
//    type = "fixed-response"
//
//    fixed_response {
//      content_type = "text/plain"
//      message_body = "Hello, from port 80"
//      status_code  = "200"
//    }
//  }  

}

//resource "aws_lb_listener" "https" {
//
//  load_balancer_arn = aws_lb.this.arn
//  port              = "443"
//  protocol          = "HTTPS"
//  certificate_arn   = aws_acm_certificate.this.arn
//
//  default_action {
//    type             = "forward"
//    target_group_arn = aws_lb_target_group.https.arn
//  }
//
//  depends_on = [
//    aws_acm_certificate.this,
//    aws_acm_certificate_validation.this
//  ]
//
//}

########################################################################################################################
# 4 - REGISTER WEB SERVERS WITH TARGET GROUPS
########################################################################################################################

resource "aws_lb_target_group_attachment" "http" {
  
  count = length(module.web-servers)
  
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = module.web-servers[count.index].id
  port             = 80
  
}

//resource "aws_lb_target_group_attachment" "https" {
//
//  count = length(module.web-servers)
//
//  target_group_arn = aws_lb_target_group.https.arn
//  target_id        = module.web-servers[count.index].id
//  port             = 443
//
//}