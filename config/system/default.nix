{ ... }:

{
  imports = [
    ./debloat
    ./packages
    ./fonts
  ];

  system.autoUpgrade.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
