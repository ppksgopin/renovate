#!/bin/bash

mkdir /etc/apt/apt.conf.d/off && mv /etc/apt/apt.conf.d/20apt-esm-hook.conf /etc/apt/apt.conf.d/off  

apt-get update -y && apt --fix-broken install -y && apt-get upgrade -y
apt-get install ibus-chewing -y

apt purge kate -y && apt autoremove -y

apt install linux-headers-generic build-essential dkms git -y

apt install qemu-system libguestfs-tools libvirt-clients libvirt-daemon-system bridge-utils virt-manager ovmf swtpm -y
usermod -a -G libvirt ppksgopin
usermod -a -G kvm ppksgopin
usermod -a -G input ppksgopin
systemctl enable --now libvirtd && systemctl start libvirtd
sudo virsh net-start default
sudo virsh net-autostart default

apt install tree p7zip-full -y
echo "ppksgopin  ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/ppksgopin

apt install ssh firewalld -y
systemctl start ssh && systemctl enable --now ssh
systemctl start firewalld && systemctl enable --now firewalld

apt-get update -y && apt --fix-broken install -y && apt-get upgrade -y

reboot
