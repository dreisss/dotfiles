{ pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  environment.systemPackages = (with pkgs; [
    # general
    firefox
    discord
    obsidian
    obs-studio
    gimp
    tiled
    libresprite

    # terminal apps
    alacritty
    tmux
    fish
    starship
    helix

    # to fish / replacements
    zoxide
    xcp
    rm-improved
    bat
    ripgrep
    delta
    fd
    eza
    du-dust
    procs
    atuin

    # must-have
    git
    git-lfs
    unzip
    unrar
    wget
    jq
    httpie

    # others terminal apps
    gum
    glow
    btop
    grex
    tokei
    xclip
    slides
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
    nodePackages_latest.pnpm
    nodejs_20
    go_1_21

    (python3.withPackages (ps: with ps; [
      numpy
      pandas
    ]))
  ]);
}
