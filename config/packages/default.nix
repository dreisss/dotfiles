{ pkgs, lib, ... }:

with pkgs; let
  general = [
    (builtins.getFlake "github:0xc000022070/zen-browser-flake").packages."${pkgs.system}".default
    discord
    custom.anytype
    google-chrome
    vlc

    ventoy-full
    sly # photoeditor
    smile # emojipicker
    neohtop # system monitor

    logiops # MX Master 3S settings
    solaar
  ];
  dev = [
    unstable.ghostty
    tmux
    fish
    starship
    helix

    (with unstable; [
      # rust
      rustc
      cargo
      clippy
      gcc

      # go
      go

      # js/ts
      nodejs_20
      nodePackages_latest.pnpm
      bun

      # python
      (python3.withPackages (ps: with ps; [
        numpy
        pandas
        # polars
        xlsx2csv
        matplotlib
      ]))

      # other
      cbqn

      android-tools
    ])
  ];
  cli-tools = [
    # rust replacements
    eza # ls
    zoxide # cd
    xcp # cp
    rm-improved # rm
    bat # cat
    ripgrep # grep
    delta # diff
    fd # find
    sd # sed
    btop # top
    du-dust # du
    procs # ps
    tlrc # man
    viu # see images in terminal
    nushell

    # latex utilities
    (texlive.combine {
      inherit (pkgs.texlive) scheme-full biblatex csquotes;
    })

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
    xsel
    entr
    tokei
    hyperfine
    grex
    fzf
    neofetch
    license-generator
    live-server
    clipman
    turbo
  ];
in
{
  environment.systemPackages = lib.flatten [
    general
    dev
    cli-tools
  ];
}
