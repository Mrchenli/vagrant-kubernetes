#!/bin/bash

echo "docker install started"

echo "1.Update the apt package index:"
sudo apt-get update

echo "2.Install packages to allow apt to use a repository over HTTPS:"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "3.Add Docker’s official GPG key:"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "4.Use the following command to set up the stable repository."
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "5.Install a specific version using the version string from the second column."
sudo apt-get install -y docker-ce=5:18.09.0~3-0~ubuntu-bionic  docker-ce-cli=5:18.09.0~3-0~ubuntu-bionic  containerd.io

mkdir -p /etc/docker/

touch daemon.json
echo '{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}' >> daemon.json
sudo mv daemon.json /etc/docker/daemon.json

sudo systemctl daemon-reload
sudo service docker restart

echo "6.vagrant to use docker."
sudo chmod 666 /var/run/docker.sock
docker images