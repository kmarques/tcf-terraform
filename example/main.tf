provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = var.aws_instance_ami
  instance_type = var.aws_instance_type

  provisioner "file" {
    source = "test-fixtures/hello-world.sh"
    destination = "/tmp/hello-world.sh"
    connection {
      type = "ssh"
      user = "root"
      private_key = var.ssh_private_key
      host = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo 'Hello, world!' > /tmp/hello-world.txt"
  }

  provisioner "remote-exec" {
      inline = [
          "sudo apt-get update"
      ]
      
      connection {
      type = "ssh"
      user = "root"
      private_key = var.ssh_private_key
      host = self.public_ip
      }
  }

  tags = {
    Name = "HelloWorld2"
  }
}