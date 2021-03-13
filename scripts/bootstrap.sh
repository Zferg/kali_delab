#!/bin/bash

echo "Starting bootstrap..."


echo "Updating apt and installing packages"
# Update apt and snap
sudo apt update
# Grab snapd - package manager
sudo apt install snapd
# Grab xclip - clipboard support on text editor
sudo apt install xclip
sudo systemctl enable --now snapd apparmor


echo "Setting up docker"
# Install Docker
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker "$USER"

# Install Docker Compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

echo "Docker complete."

echo "Setting up languages and editors for development"
# Install applications 
# and languages
sudo snap install task --classic
sudo snap install micro --classic
sudo apt update
sudo apt install -y golang-go
sudo apt-get install -y tldr

echo "Setting up directory structure for development"
# Create code environment
mkdir -p ~/Desktop/code/workspace
mkdir -p ~/Desktop/code/scripts
mkdir -p ~/Desktop/code/golang
mkdir -p ~/Desktop/code/python
mkdir -p ~/Desktop/code/javascript

echo "Setting up directory structure for CTFs"
# Create ctf environment
mkdir -p ~/Desktop/ctf/loot
mkdir -p ~/Desktop/ctf/notes
mkdir -p ~/Desktop/ctf/workspace

echo "All done! You may need to run this script a second time after logging out and in to complete setup."