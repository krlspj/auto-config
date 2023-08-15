#!/bin/bash

echo "docker engine installation start"

echo "uninstall conflicting packages..."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done


sudo apt-get -y update
sudo apt-get -y install ca-certificates curl gnupg

# add docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "bookworm" stable" | \
  #"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

 allow run docker without root privileges
if getent group docker >/dev/null; then
    echo "Group 'docker' already exists."
else
    echo "Group 'docker' does not exist. Creating..."
    sudo groupadd docker
fi

echo "add user to docker"
sudo usermod -aG docker $USER

echo "activate group docker for this termianl"
newgrp docker
#sg docker -c "docker run hello-world"

echo "docker engine installation completed"
