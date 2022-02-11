// first create an HTTP server: 80 TCP, 22 TCP, CIDR ["0.0.0.0/0"]
// then create a security group with the above config


resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-075343a660b9eb15c"

  // IN -> ingress: where to allow traffic from
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // IN -> ingress for ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // OUT -> egress: what can you do from this server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "http_server_sg"
  }
}

// create a virtual server
resource "aws_instance" "http_server" {
  ami                    = "ami-033b95fb8079dc481"
  key_name               = "friday-0211"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  // get this from vpc on aws
  subnet_id = "subnet-03f0d4627c28d93a5"
}