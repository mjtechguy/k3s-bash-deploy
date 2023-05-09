#!/bin/bash

# Install k3s
curl -sfL https://get.k3s.io | sh -

# Wait for k3s to start
sleep 5

# Get the k3s kubeconfig file
mkdir ~/.kube
sudo cat /etc/rancher/k3s/k3s.yaml > ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config
