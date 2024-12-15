resource "aws_instance" "nginx_server" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "NginxServer"
  }
}
