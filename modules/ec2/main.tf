resource "aws_key_pair" "auth" {
  key_name   = var.aws_key_pair_name
  public_key = var.public_key
}

resource "aws_instance" "web" {
  ami           = var.aws_instance_image
  instance_type = var.aws_ec2_type
  count = "1"
  associate_public_ip_address = "true"

  key_name = aws_key_pair.auth.id
  vpc_security_group_ids = var.network.security_groups
  subnet_id = var.network.default_subnet_id

  tags {
    Name = "Web"
    Product = "Node"
  }

  provisioner "file" {
    source      = "./api"
    destination = "/home/ec2-user/app"
    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = var.private_key
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nodejs",
      "sudo npm install -g pm2",
      "sudo pm2 startup"
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = var.private_key
    }
  }
}
