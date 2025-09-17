#!/bin/bash

sudo -i

echo "Updating package list..."
sudo apt update && sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y && sudo apt autoclean

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

sudo mkdir -p /var/www/service.titansjet.sty
cd /var/www/service.titansjet.sty
git clone https://gitlab-ci-token:glpat-x5n5gUu5nAc_4YEerjsQ@gitlab.com/bookengine-dev/localhost.titansjet.sty.git .

yarn install
yarn build

pm2 start npm --name "service.titansjet.sty" -- run start:prod
pm2 show service.titansjet.sty
pm2 ls

echo "Installation complete!"

# login tailscale
tailscale login
