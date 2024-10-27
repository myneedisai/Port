provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "nginx_instance" {
  ami           = var.ami_id          # Update with your desired AMI ID
  instance_type = var.ec2_instance_type

  # Specify your key pair name
  key_name      = var.pem_key_name

  # Add security group for HTTP access
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  # User data to install Nginx and serve a Hello World page
  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>Hello World</h1>" > /var/www/html/index.html
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-instance"
  }
}

resource "aws_security_group" "nginx_sg" {
  name        = "nginx_security_group"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from anywhere (adjust as needed)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

