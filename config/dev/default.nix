{ ... }:

{
  imports = [
    ./terminal/ghostty.nix
    ./terminal/tmux.nix
    ./shell/fish.nix
    ./shell/starship.nix
    ./editor/helix.nix
    ./editor/packages.nix
    ./othertools/git.nix
    ./othertools/gh.nix
  ];
}
