{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; lib.flatten [
    # utilities
    custom.zen
    custom.anytype
    vicinae
    discord

    # secondary utilities
    vlc
    google-chrome
    sly # photoeditor
    ventoy-full

    # system + config
    neohtop # system monitor
    logiops # MX Master 3S settings
    solaar

    # dev environment
    unstable.ghostty
    tmux
    fish
    starship
    helix
    git
    git-lfs
    license-generator
    live-server
    turbo

    # cli environment
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
    dust # du
    procs # ps
    tlrc # man
    viu # see images in terminal
    nushell
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
    clipman

    # programming languages, libraries, ...
    (with unstable; [
      # rust
      rustc
      cargo
      clippy
      gcc

      # crystal
      crystal

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

    # latex
    (texlive.combine {
      inherit (pkgs.texlive) scheme-full biblatex csquotes;
    })
  ];
}
