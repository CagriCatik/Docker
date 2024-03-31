#!/bin/bash

# Update package index
sudo apt update

# Install dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package index again
sudo apt update

# Install Docker
sudo apt install -y docker-ce

# Add your user to the docker group to run Docker commands without sudo
sudo usermod -aG docker $USER

# Check if Visual Studio Code is installed
if ! command -v code &> /dev/null
then
    echo "Visual Studio Code is not installed. Installing..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y code
    echo "Visual Studio Code installed successfully!"
else
    echo "Visual Studio Code is already installed."
fi

# Install Docker extension for Visual Studio Code
code --install-extension ms-azuretools.vscode-docker

# Done
echo "Docker and Docker extension for Visual Studio Code installed successfully!"
