//output "zone" {
//  value = data.aws_route53_zone.this
//}
//
//output "record" {
//  value = aws_route53_record.this
//}
//
//output "certificate" {
//  value = aws_acm_certificate.this
//}
//
//output "validation" {
//  value = aws_acm_certificate_validation.this
//}

output "load_balancer_url" {
  value = aws_lb.this.dns_name
}

output "ssh_commands" {
  value = module.web-servers.*.ssh_command
}

output "user_data" {
  value = data.template_file.user_data.rendered
}