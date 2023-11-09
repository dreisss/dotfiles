{ pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" ];

  environment.systemPackages = (with pkgs; [
    # general
    firefox
    discord
    obsidian
    obs-studio
    gimp

    # terminal apps
    alacritty
    tmux
    fish
    starship
    helix

    # to fish
    zoxide
    xcp
    rm-improved
    bat
    ripgrep
    delta
    fd
    unstable.eza

    # must-have
    git
    git-lfs
    unzip
    unrar
    wget

    # others terminal apps
    gum
    glow
    btop
    grex
    tokei
    xclip
    slides
    httpie
    lazygit
    neofetch
    hyperfine
    license-generator
    nodePackages_latest.live-server
    ngrok
    entr
  ]) ++ (with pkgs.unstable; [
    vscode
    rustc
    cargo
    clippy
    gcc
    bun
    nodejs_20
    go_1_21

    (python3.withPackages (ps: with ps; [
      numpy
      pandas
    ]))
  ]);
}
