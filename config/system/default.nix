{ lib, ... }:

let
  file = builtins.readFile;
  trim = lib.strings.trim;
  version = trim (file ../../nixos-version);
in
{
  imports = [
    ./debloat
    ./virtualization
    ./fonts
  ];

  system = {
    stateVersion = version;
    autoUpgrade.enable = true;
  };

  services = {
    xserver.enable = true; # optional
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
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

  time.hardwareClockInLocalTime = true;
}
