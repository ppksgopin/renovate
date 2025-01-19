#!/bin/bash

apt-get update -y && apt-get upgrade -y
apt-get install ibus-chewing -y

apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y && apt-get upgrade -y
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker && systemctl enable --now docker
apt-get update -y && apt-get upgrade -y

apt purge kate -y
apt autoremove -y



apt install tree p7zip-full -y
echo "ppksgopin  ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/ppksgopin
apt-get update -y && apt-get upgrade -y
reboot
