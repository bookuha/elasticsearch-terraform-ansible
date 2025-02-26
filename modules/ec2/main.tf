resource "aws_security_group" "ssh_sg" {
  vpc_id = var.vpc_id
  name   = "allow_ssh"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "my_key" {
  key_name   = "SSH key"
  public_key = file("~/.ssh/id_ed25519.pub")
}


resource "aws_instance" "ec2_ansible" {
  ami                    = "ami-07a64b147d3500b6a" # AL 2023
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  key_name               = aws_key_pair.my_key.key_name

  associate_public_ip_address = true

   user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable ansible2
              yum install -y ansible
              EOF
  tags = {
    Name = "peex-ec2-instance"
  }
}

resource "aws_instance" "ec2_elastic" {
  ami                    = "ami-07a64b147d3500b6a" # AL 2023
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  key_name               = aws_key_pair.my_key.key_name

  associate_public_ip_address = true

  tags = {
    Name = "peex-ec2-instance"
  }
}
