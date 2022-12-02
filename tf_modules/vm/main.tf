 resource "aws_instance" "web-server" {
  for_each = var.pub-id
  subnet_id = each.value["subnet_id"]
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [var.sg]
  key_name = var.key-pair
  user_data = <<-EOF
  #!/bin/bash
  sudo su -
  apt upgrade
  apt install nginx -y
  apt install docker.io -y
  sleep 15
  exit
  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
  sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
  systemctl restart sshd.service
  echo -e "toshi\ntoshi" |passwd ubuntu 
  hostnamectl set-hostname ${each.value["name"]}

  EOF

 tags =  merge({
    # Envirenment = var.environment 
    # BuildBy = var.buildby
    Name ="EC2-${each.value["name"]}"

  })


 }
 