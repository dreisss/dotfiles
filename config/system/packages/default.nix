{ pkgs, lib, ... }:

let
  general-use = with pkgs; [
    firefox
    google-chrome
    discord
    obsidian
    gimp
    # obs-studio # casual use
    # tiled # casual use
    # libresprite # casual use 
  ];
  development-environment = lib.flatten (with pkgs; [
    alacritty
    tmux
    fish
    starship
    helix
    vscode

    (with unstable; [
      (rWrapper.override {
        packages = lib.flatten (with pkgs; [
          R

          (with rPackages; [
            languageserver
            readxl
            lintr
          ])
        ]);
      })

      # rust
      rustc
      cargo
      clippy
      gcc

      # go
      go_1_22

      # js/ts
      nodejs_20
      nodePackages_latest.pnpm
      bun

      nodePackages_latest.prisma
      prisma-engines

      # python
      (python3.withPackages (ps: with ps; [
        numpy
        pandas
        polars
        xlsx2csv
        matplotlib
      ]))
    ])
  ]);
  cli-tools = with pkgs; [
    # rust replacements
    eza # ls
    zoxide # cd
    xcp # cp
    rm-improved # rm
    bat # cat
    ripgrep # grep
    delta # diff
    fd # find
    btop # top
    du-dust # du
    procs # ps
    # atuin # history

    # common tools
    git
    git-lfs
    unzip
    unrar
    curl
    wget
    httpie
    jq
    xclip
    entr
    tokei
    hyperfine
    grex
    neofetch
    license-generator
    nodePackages_latest.live-server
  ];
  other = with pkgs; [
    openssl_3_1
    nix-prefetch-github
  ];
in
{
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  environment.systemPackages = lib.flatten [
    general-use
    development-environment
    cli-tools
    other
  ];
}
