{ pkgs, ... }:

{
  packages = (with pkgs; [
    firefox
    discord
    obsidian
    obs-studio
    gimp

    alacritty
    tmux
    fish
    starship
    helix
    git
    git-lfs

    zoxide
    exa
    bat
    xcp
    rm-improved
    ripgrep
    fd
    delta

    neofetch
    tokei
    hyperfine
    btop
    grex
    gum
    glow
    slides
    httpie
    lazygit
    xclip
    license-generator
    entr
    unzip
    unrar
    nodePackages_latest.live-server
    wget

    gnome.gnome-tweaks
  ]);
}
