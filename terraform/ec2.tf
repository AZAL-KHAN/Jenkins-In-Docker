# Kep Pair (Login)
resource "aws_key_pair" "iac_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# EC2 Instance
resource "aws_instance" "docker_host" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.iac_key.key_name
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  root_block_device {
  volume_size = var.root_volume_size
  volume_type = var.root_volume_type
}

  tags = {
    Name        = "docker-ec2"
    Environment = var.environment
    Role        = "docker"
  }
}
