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

    # other
    openssl_3_1
  ]) ++ (with pkgs.unstable; [
    vscode
    rustc
    cargo
    clippy
    gcc
    bun
    nodePackages_latest.pnpm
    nodejs_20
    nodePackages_latest.prisma
    prisma-engines
    go_1_22

    (python3.withPackages (ps: with ps; [
      numpy
      pandas
    ]))
  ]);
}
