#!/bin/bash

# Check if environmental variables for IP addresses are set
if [[ -z $IP1 ]]; then
    read -p "Enter IP address of the first machine: " IP1
fi

if [[ -z $IP2 ]]; then
    read -p "Enter IP address of the second machine: " IP2
fi

if [[ -z $IP3 ]]; then
    read -p "Enter IP address of the third machine: " IP3
fi

# Install K3s on the first machine
ssh user@$IP1 "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server' sh -"

# Get the K3s token from the first machine
TOKEN=$(ssh user@$IP1 "sudo cat /var/lib/rancher/k3s/server/node-token")

# Install K3s on the second machine
ssh user@$IP2 "curl -sfL https://get.k3s.io | K3S_URL=https://$IP1:6443 K3S_TOKEN=$TOKEN sh -"

# Install K3s on the third machine
ssh user@$IP3 "curl -sfL https://get.k3s.io | K3S_URL=https://$IP1:6443 K3S_TOKEN=$TOKEN sh -"

echo "K3s deployment completed successfully!"
