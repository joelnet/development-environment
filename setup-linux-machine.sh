#!/bin/sh

sudo apt install apt-transport-https curl htop vim tmux unrar p7zip-full

# Install Liquorix Kernel
sudo add-apt-repository ppa:damentz/liquorix
sudo apt-get update
sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64

# Install Howdy (face unlock)
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update
sudo apt install howdy v4l-utils

# Remove IRQBALANCE
sudo apt-get remove irqbalance

# Install VLC
sudo apt install vlc

# Install Gnome Shell Extensions
# https://askubuntu.com/questions/960597/how-do-i-move-clock-to-the-right-end-of-gnome-3-panel-from-the-middle
sudo apt install gnome-tweak-tool chrome-gnome-shell

# Install Tailscale
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale
sudo tailscale up

# Install ngrok
sudo snap install ngrok

# Install VSCode Insiders
sudo snap install --classic code-insiders

# Install NodeJS
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" > ~/.profile
source ~/.profile
sudo apt install npm
sudo npm install --global n
sudo n lts


# Install Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Install OBS
sudo apt install ffmpeg v4l2loopback-dkms
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install obs-studio

# Install Discord
sudo snap install discord

# Install Slack
sudo snap install slack --classic

# Install Zoom
sudo snap install zoom-client

# Install Lutris
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris

# Install Resilio Sync
echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
curl -L https://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add
sudo apt-get update
sudo apt-get install resilio-sync
sudo systemctl enable resilio-sync

# Install KeePassXC
sudo apt install keepassxc

# Install scrcpy
sudo apt install scrcpy
mkdir sndcpy
(cd sndcpy && curl -OL https://github.com/rom1v/sndcpy/releases/download/v1.0/sndcpy-v1.0.zip)
(cd sndcpy && unzip sndcpy-v1.0.zip)

# Install Inkscape
sudo apt-get install inkscape
