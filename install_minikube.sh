#! /bin/bash

# Install kubernetes
curl -Lo /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x /usr/bin/kubectl
curl -Lo /usr/bin/minikube https://storage.googleapis.com/minikube/releases/v1.0.0/minikube-linux-amd64
chmod +x /usr/bin/minikube

# Create a kubernetes group
groupadd kubernetes
usermod -aG kubernetes khurtado

# Deploy minimuke
mkdir /var/kubernetes
env MINIKUBE_HOME=/var/kubernetes/.minikube KUBECONFIG=/var/kubernetes/.kube/config minikube start --vm-driver none
chgrp -R kubernetes /var/kubernetes
find /var/kubernetes -type d -exec chmod g+rx {} \;
find /var/kubernetes -type f -exec chmod g+r {} \;

echo export MINIKUBE_HOME=/var/kubernetes/.minikube >> /etc/profile.d/kubernetes.sh
echo export KUBECONFIG=/var/kubernetes/.kube/config >> /etc/profile.d/kubernetes.sh





# WARNING LATELLY IVE BEEN GETTING eeeors with
coredns : 127.0.0.1 Connection refused

kubectl describe pod coredns.... 

SOlution:
curl -Lo /usr/bin/minikube https://storage.googleapis.com/minikube/releases/v1.22.0/minikube-linux-amd64

# Needed
yum install conntrack-tools
