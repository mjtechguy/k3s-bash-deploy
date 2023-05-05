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

# Function to remove K3s from a machine
remove_k3s() {
    local IP=$1
    ssh user@$IP "sudo /usr/local/bin/k3s-uninstall.sh"
}

# Remove K3s from each machine
remove_k3s $IP1
remove_k3s $IP2
remove_k3s $IP3

echo "K3s removal completed successfully!"
