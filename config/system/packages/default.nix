{ pkgs, ... }:

let
  nixos-unstable = import <nixos-unstable> {
    config = { allowUnfree = true; };
  };
in
{
  environment.systemPackages = (with pkgs; [
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

    gnome.gnome-tweaks

  ]) ++ (with nixos-unstable; [
    vscode
    rustc
    cargo
    clippy
    gcc
    bun

    (python3.withPackages (ps: with ps; [ ]))
  ]);
}
