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

  # environment.etc."xdg/autostart/albert.desktop" = "${pkgs.albert}/share/applications/albert.desktop";
}
