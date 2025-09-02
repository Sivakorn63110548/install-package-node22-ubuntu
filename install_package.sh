#!/bin/bash

echo "Updating package list..."
sudo apt update && sudo apt upgrade -y

echo "Installing Curl..."
sudo apt install curl -y

echo "Installing Git..."
sudo apt install git -y
git --version

echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing Node.js 22..."
nvm install 22
nvm use 22
node -v

echo "Installing Yarn..."
npm install -g yarn
yarn -v

echo "Installing PM2..."
npm install -g pm2
pm2 -v

source ~/.bashrc 

echo "Installation complete!"
