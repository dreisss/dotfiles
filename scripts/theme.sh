#!/usr/bin/env bash

wget -P /tmp https://github.com/catppuccin/gtk/releases/download/v0.6.0/Catppuccin-Mocha-Standard-Blue-Dark.zip
unzip /tmp/Catppuccin-Mocha-Standard-Blue-Dark.zip -d /tmp/catppuccin
mv /tmp/catppuccin/Catppuccin-Mocha-Standard-Blue-Dark/gtk-4.0/gtk*.css /tmp/catppuccin/Catppuccin-Mocha-Standard-Blue-Dark/gtk-4.0/assets/ ~/.config/gtk-4.0
