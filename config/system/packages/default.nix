{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

    vscode
    rustc
    cargo
    clippy
    gcc

    (python3.withPackages (ps: with ps; [ ]))

    gnome.gnome-tweaks
  ];
}
