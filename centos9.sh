# !/bin/bash

sudo dnf install epel-release -y

sudo dnf groupinstall "Virtualization Host" -y
sudo systemctl enable --now libvirtd && sudo systemctl start libvirtd
sudo dnf -y install virt-top libguestfs-tools git
lsmod | grep kvm

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker && sudo systemctl enable --now docker
