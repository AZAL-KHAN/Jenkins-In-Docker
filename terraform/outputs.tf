output "ec2_public_ip" {
  value = aws_instance.docker_host.public_ip
}

output "ec2_instance_id" {
  value = aws_instance.docker_host.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
