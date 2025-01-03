{ pkgs, lib, ... }:

with pkgs; let
  general = [ firefox ];
  dev = [
    unstable.ghostty
    helix
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
    neofetch
    license-generator
    nodePackages_latest.live-server
  ];
in
{
  environment.systemPackages = lib.flatten [
    general
    dev
    cli-tools
  ];
}
