#!/bin/bash

set +e

# Cleanup any previous version
sudo apt-get remove docker docker-engine docker.io containerd runc

# Get pre-requirements
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

# Prevent GPG error
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

# Install Docker and Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo ""
echo "Docker and Docker compose are properly installed."
docker --version
