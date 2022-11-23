#!/bin/bash
sudo apt update -y
sudo apt upgrade -y

###sudo reboot

sudo apt install -y curl wget apt-transport-https
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube

minikube version


curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version -o yaml

minikube start --driver=docker
minikube status

echo "###################################Verify the Kubernetes version, node status and cluster info###################################"
kubectl cluster-info
kubectl get nodes
