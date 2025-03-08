#!/usr/bin/env bash

sudo nix-channel --add "https://github.com/nix-community/home-manager/archive/release-$(cat ./nixos-version).tar.gz" home-manager
sudo nix-channel --add "https://nixos.org/channels/nixpkgs-unstable" nixpkgs-unstable
sudo nix-channel --add "https://nixos.org/channels/nixos-$(cat ./nixos-version)" nixos
sudo nix-channel --update

mkdir -p ~/.config/ulauncher/user-themes
git clone https://github.com/kleber-swf/orchis-dark-ulauncher.git \
	~/.config/ulauncher/user-themes/orchis-dark

echo "INSTALL THIS EXTENSIONS TO ULAUNCHER:"
echo "https://github.com/Ulauncher/ulauncher-emoji"
echo "https://github.com/beobcode/ulauncher-session-actions"
echo "https://github.com/friday/ulauncher-clipboard"
