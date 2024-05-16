#!/bin/bash
git clone https://github.com/tmux-plugins/tmux-yank ~/Tools/

for file in .*; do
	if [ -f "$file" ]; then
		ln -s "$PWD/$file" "../$file"
	fi
done

ln -s "$PWD/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
ln -s "$PWD/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
