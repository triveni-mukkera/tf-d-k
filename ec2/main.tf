resource "aws_instance" "instance" {
 
  instance_type = "t2.micro"
  ami           = "ami-0b026d11830afcbac"
  key_name = aws_key_pair.terraformkey.key_name
  security_groups = [aws_security_group.allow_ssh.name]
  tags = {
    Name = "docker"
  }
} 

resource "aws_key_pair" "terraformkey" {
  key_name = "terraformkey"
  public_key = file("C:\\Users\\trive\\terraformkey.pub")
}

resource "aws_security_group" "allow_ssh" {
  name        = "sg"
  description = "Allow traffic"
  

  ingress {
    description = "ssh"
    from_port   = 0
    to_port     = 65535
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


