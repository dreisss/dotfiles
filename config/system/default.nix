{ pkgs, version, ... }:

{
  imports = [
    ./debloat
    ./packages
    ./virtualization
    ./fonts
  ];

  system = {
    stateVersion = version;
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

  # users.defaultUserShell = pkgs.nushell;

  time.hardwareClockInLocalTime = true;
}
