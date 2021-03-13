#!/bin/bash

BASE_DIR_CODE="~/Desktop/code"
BASE_DIR_CTF="~/Desktop/ctf"

echo "Starting bootstrap..."

echo "Updating apt and installing packages"
# Update apt and snap
sudo apt update
# Grab snapd - package manager
sudo apt-get install -y snapd
# Grab xclip - clipboard support on text editor
sudo apt-get install -y xclip
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
mkdir -p "$BASE_DIR_CODE"/workspace
mkdir -p "$BASE_DIR_CODE"/scripts
mkdir -p "$BASE_DIR_CODE"/golang
mkdir -p "$BASE_DIR_CODE"/python
mkdir -p "$BASE_DIR_CODE"/javascript

echo "Setting up directory structure for CTFs"
# Create ctf environment
mkdir -p "$BASE_DIR_CTF"/loot
mkdir -p "$BASE_DIR_CTF"/notes
mkdir -p "$BASE_DIR_CTF"/workspace

echo "All done! You may need to run this script a second time after logging out and in to complete setup."