resource "aws_instance" "instance" {
  count         = 3
  instance_type = "t2.micro"
  ami           = "ami-07650ecb0de9bd731"
  key_name = aws_key_pair.terraformkey.key_name
  tags = {
    Name = var.instance_names[count.index]
  }
} 

resource "aws_key_pair" "terraformkey" {
  key_name = "terraformkey"
  public_key = file("C:\\Users\\trive\\terraformkey.pub")
}

# resource "aws_instance" "condition" {
#    ami           = "ami-07650ecb0de9bd731"
#   instance_type = var.isprod ? "t3.large" : "t2.micro"
# }

# resource "aws_instance" "condition" {
#   ami           = "ami-07650ecb0de9bd731"
#   instance_type = var.env == "DEV" ? "t3.large" : "t2.micro"
# }


