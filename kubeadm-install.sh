#!/bin/bash

echo "kubeadm install started"

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF >kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo mv kubernetes.list /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

sudo swapoff -a

kubeadm version

echo "kubeadm installed please change external ip manaully"

#/etc/systemd/system/kubelet.service.d/10-kubeadm.conf
#添加一行
#Environment="KUBELET_EXTRA_ARGS=--node-ip=<worker IP address>"

# sudo systemctl daemon-reload
# sudo systemctl restart kubelet
