resource "aws_instance" "xpix_app_server" {
  ami                         = var.ami_id
  instance_type               = "t3.micro"
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.public_1a.id
  vpc_security_group_ids      = [aws_security_group.xpix_app_server.id]
  iam_instance_profile        = var.instance_profile_name
  key_name                    = "xpix-key"
  associate_public_ip_address = true
  user_data                   = file("${path.module}/user_data.sh")

  tags = {
    Name = "xpix-app-server"
  }
}

import {
  to = aws_instance.xpix_app_server
  id = "i-01307bac036dcb516"
}

output "xpix_public_ip" {
  value = aws_instance.xpix_app_server.public_ip
}