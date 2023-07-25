data "aws_ami" "ec2-first" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "tls_private_key" "terrafrom_generated_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {

  # Name of key: Write the custom name of your key
  key_name   = "tf-key-pair-test"

  # Public Key: The public will be generated using the reference of tls_private_key.terrafrom_generated_private_key
  public_key = tls_private_key.terrafrom_generated_private_key.public_key_openssh

  # Store private key :  Generate and save private key(aws_keys_pairs.pem) in current directory
  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.terrafrom_generated_private_key.private_key_pem}' > aws_keys_pairs.pem
      chmod 400 aws_keys_pairs.pem
    EOT
  }
}

resource "aws_instance" "ec2-first" {
  ami = "ami-05548f9cecf47b442"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id_target
  monitoring    = true
  user_data     = file("${path.module}/app-install.sh")
  tags = {
    Name = "AL4-BASTION"
  }

  key_name= "tf-key-pair-test"

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    
    # Mention the exact private key name which will be generated 
    private_key = file("aws_keys_pairs.pem")
    timeout     = "4m"
  }
}





