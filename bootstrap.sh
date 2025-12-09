#!/usr/bin/env bash
set -e

# INSTALAMOS HERRAMIENTAS VARIAS
sudo apt-get update -y
sudo apt-get install -y \
    unzip \
    ca-certificates \
    curl \
    gnupg \
    git

# INSTALAR TERRAFORRM
TERRAFORM_VERSION="1.5.7"

wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv -f terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# INSTALAR ANSIBLE
sudo apt-get install -y ansible

# INSTALAMOS DOCKER, DOCKER ENGINE, COMPOSE
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
ARCH=$(dpkg --print-architecture)
CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
echo \
"deb [arch=$ARCH signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $CODENAME stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# HABLITAR DOCKER SIN SUDO
sudo groupadd docker 2>/dev/null || true
sudo usermod -aG docker vagrant

# INSTALAR KUBECTL
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# INSTALAR MINIKUBE
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# LIMPIAMOS ARCHIVOS
sudo apt-get autoremove -y
sudo apt-get clean

# FIN
echo " *INSTALACION COMPLETA*"

