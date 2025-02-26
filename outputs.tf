output "public_ip_ansible" {
  description = "Public IP of the EC2 Ansible instance"
  value       = module.ec2.public_ip_ansible
}

output "public_ip_elastic" {
  description = "Public IP of the EC2 Elastic instance"
  value       = module.ec2.public_ip_elastic
}