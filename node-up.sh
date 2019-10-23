kubeadm join 172.17.8.101:6443 --token bpns13.eq1z0vobdbwdd0p2 \
    --discovery-token-ca-cert-hash sha256:1deb1738b69f67a705ab17f49da448119d1c620a4a11fc51c42bb98875dcac75 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/kubelet.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get pods --all-namespaces
