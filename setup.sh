#!/bin/bash
git clone https://github.com/tmux-plugins/tmux-yank ~/Tools/

for file in .*; do
	if [ -f "$file" ]; then
		ln -s "$PWD/$file" "../$file"
	fi
done
