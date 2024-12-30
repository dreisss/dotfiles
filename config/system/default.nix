{ pkgs, lib, ... }:

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

  services.xserver.xkb = {
    layout = "us,br";
    options = "compose:ins,";
  };

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

  time.hardwareClockInLocalTime = true;
}
