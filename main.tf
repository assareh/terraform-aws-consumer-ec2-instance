data "aws_ami" "hashidemos" {
  owners      = ["self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["assareh-hashidemos-*"]
  }
}

resource "aws_instance" "this" {
  count = var.instance_count
  ami           = data.aws_ami.hashidemos.id
  instance_type = "t2.micro"

  tags = {
    Owner = "Consumer"
  }
}
