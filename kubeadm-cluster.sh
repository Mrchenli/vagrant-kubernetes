
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=172.17.8.101

sudo sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
kubectl get pods --all-namespaces

sudo kubeadm join 172.17.8.101:6443 --token 92jxab.l2h4ir9qptvnrcl4 \
    --discovery-token-ca-cert-hash sha256:58274fca287b1e7de39c3e57487ee4dba55b2321013aa2526bc7e8a03935c396


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/kubelet.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


sudo cp -i admin.conf $HOME/.kube/config


编辑
/etc/systemd/system/kubelet.service.d/10-kubeadm.conf
添加一行
Environment="KUBELET_EXTRA_ARGS=--node-ip=<worker IP address>"


eyJhbGciOiJSUzI1NiIsImtpZCI6InpzLWtVenF4YlpIT01Ja0NOWHVVeC1vQzZnLWlwRjl4RzJJendHSFZMcGsifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLXg4Z3duIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiIzOWViMWI5Zi1lZDkwLTRlNzAtODgxNi0xYWNlOTJmMTE4NTEiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZXJuZXRlcy1kYXNoYm9hcmQ6YWRtaW4tdXNlciJ9.JBwXbnrsnnN-lAksSRGVf_uZNBV1K4btstecxjTIlagXYKQg1I7FLLaml9wIcnKiheDc0DpJi64wychpkmuJRKkjH9GdGKSBf0mlrqu09CP-xbayIK0s7LFnABcumoT1NXcHI-Ti1Ez7KgOwACNZZx-K8TnCIxPKB2nN9WdRoF3pByXEwLSN3k7MfWBOq0NjYt41RT612MuAirDohtqNFFPSqvDQCaa8mybsxReH35iXk2BMJB6z4tPopASOlq5YFfpFBAr8cdAVDjrpxz6LthfXvjEXRAeWXFAarTJx507fjpe4wHmPcgTFfNBHMfou0_XG358c6U39b1tUqeiDVg