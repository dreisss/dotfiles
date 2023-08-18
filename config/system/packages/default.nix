{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

    vscode
    rustc
    cargo

    (python3.withPackages (ps: with ps; [ ]))

    gnome.gnome-tweaks
  ];
}
