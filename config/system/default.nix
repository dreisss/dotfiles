{ lib, pkgs, ... }:

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

  users.users.dreisss.linger = true;

  systemd.services.logid = {
    enable = true;
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = lib.getExe pkgs.logiops;
      Restart = "on-failure";
    };
  };
}
