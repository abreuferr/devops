# Configuracao the AWS Provider
provider "aws" {
  region = "sa-east-1"
  shared_credentials_file = "/Users/cosmo/.aws/credentials"
  profile = "cferreira"
}

# criacao de uma vm na aws
resource "aws_instance" "terraform_exemplo" {
  ami = "ami-064a0193585662d74"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.cferreira-key.key_name}"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}

resource "aws_key_pair" "cferreira-key" {
  key_name   = "cferreira-key"
  public_key = "${file("/Users/cosmo/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "example_public_dns" {
  value = "${aws_instance.terraform_exemplo.public_dns}"
}