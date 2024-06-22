{ ... }:

{
  imports = [
    ./fish
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
