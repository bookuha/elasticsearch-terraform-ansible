output "public_ip_ansible" {
  description = "Public IP of the EC2 Ansible instance"
  value       = aws_instance.ec2_ansible.public_ip
}

output "public_ip_elastic" {
  description = "Public IP of the EC2 Elastic instance"
  value       = aws_instance.ec2_elastic.public_ip
}