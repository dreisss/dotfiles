{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    discord
    obsidian
    obs-studio
    gimp

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

    vscode

    gnome.gnome-tweaks
  ];
}
