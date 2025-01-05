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

  home.file.".config/eza/theme.yml".text = builtins.readFile (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/eza-community/eza-themes/refs/heads/main/themes/tokyonight.yml";
  });
}
