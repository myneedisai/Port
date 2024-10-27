data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    
    owners = ["099720109477"] # Canonical
}
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "nginx_instance" {
  ami = data.aws_ami.ubuntu.id   # Update with your desired AMI ID
  instance_type = var.ec2_instance_type
  key_name      = var.pem_key_name   # Specify your key pair name
  vpc_security_group_ids = [aws_security_group.nginx_sg1.id]  # Add security group for HTTP access

  # User data to install Nginx and serve a Hello World page
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              echo "<h1>Hello World</h1>" > /var/www/html/index.nginx-debian.html
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-instance"
  }
}

resource "aws_security_group" "nginx_sg1" {
  name        = "nginx_security_group1"
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

