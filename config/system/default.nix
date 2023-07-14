{ pkgs, ... }:

{
  imports = [
    ./debloat
    ./packages
    ./fonts
  ];

  system = {
    stateVersion = "23.05";
    autoUpgrade.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
