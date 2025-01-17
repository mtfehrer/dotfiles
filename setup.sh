#!/bin/bash
#Update our apt package registry and upgrade current packages
apt update && apt upgrade -y

#Install all packages in packages.txt
sudo -s xargs -a packages.txt apt install -y

#Create symlinks for all files in this directory
for file in .*; do
	if [ -f "$file" ]; then
		ln -sf "$PWD/$file" "../$file"
	fi
done

#Create VS Code symlinks
mkdir $HOME/.config/Code/User
ln -s "$PWD/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
ln -s "$PWD/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

#Download tmux plugin manager and tmux-yank plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-yank ~/Tools/

#Add docker compose plugin
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

#Add current user to docker group so we can run docker commands without sudo, and reload docker group
sudo -s usermod -aG docker $USER && newgrp docker
