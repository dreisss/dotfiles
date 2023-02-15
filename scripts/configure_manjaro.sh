#!/bin/bash
# run with "sudo ./configure_manjaro.sh"

# --> configure/update system (manjaro)
# 1. configure pacman closest/fatest mirrors
pacman-mirrors --fasttrack
# 2. configure pacman to 5 parallel downloads
echo "[options]\nParallelDownloads = 5\nILoveCandy" | sudo tee -a /etc/pacman.conf 
# 3. update system packages
pacman -Syyu

# --> install basic/initial packages/apps
# 1. install basic packages
pacman -Sy base-devel
