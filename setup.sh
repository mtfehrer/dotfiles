#!/bin/bash
#Update our apt package registry and upgrade current packages
apt update && apt upgrade

#Install all packages in packages.txt
sudo xargs -a packages.txt apt install -y

git clone https://github.com/tmux-plugins/tmux-yank ~/Tools/

for file in .*; do
	if [ -f "$file" ]; then
		ln -s "$PWD/$file" "../$file"
	fi
done

ln -s "$PWD/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
ln -s "$PWD/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

#Add current user to docker group so we can run docker commands without sudo
sudo usermod -aG docker $USER
