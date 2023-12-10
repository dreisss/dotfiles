{ pkgs, ... }:

{
  imports = [
    ./debloat
    ./packages
    ./virtualization
    ./fonts
  ];

  system = {
    stateVersion = "23.11";
    autoUpgrade.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  time.hardwareClockInLocalTime = true;
}
