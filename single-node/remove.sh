#!/bin/bash

# Stop k3s
sudo /usr/local/bin/k3s-uninstall.sh

# Remove k3s systemd service
sudo systemctl stop k3s
sudo systemctl disable k3s
sudo rm /etc/systemd/system/k3s.service

# Remove k3s related files and directories
sudo rm -rf /etc/rancher/k3s
sudo rm -rf /var/lib/rancher/k3s
sudo rm -rf /var/lib/kubelet
sudo rm -rf /var/lib/cni
sudo rm -rf /run/flannel
