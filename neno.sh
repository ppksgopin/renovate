#!/bin/bash

mkdir /etc/apt/apt.conf.d/off && mv /etc/apt/apt.conf.d/20apt-esm-hook.conf /etc/apt/apt.conf.d/off  

apt-get update -y && apt-get upgrade -y

apt purge kate -y && apt autoremove -y

apt install qemu-system libguestfs-tools libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
usermod -a -G libvirt ppksgopin
usermod -a -G kvm ppksgopin
systemctl enable --now libvirtd && systemctl start libvirtd

apt install ssh firewalld tree p7zip-full -y
systemctl start ssh && systemctl enable --now ssh
systemctl start firewalld && systemctl enable --now firewalld

echo "ppksgopin  ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/ppksgopin

sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

apt-get update -y && -y && apt-get upgrade -y
