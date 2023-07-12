{ pkgs, ... }:

{
  imports = [ ./steam.nix ];

  environment.systemPackages = with pkgs; [
    firefox
    discord
    obsidian
    obs-studio
    gimp

    wget
    unzip
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

    vscode
  ];
}
