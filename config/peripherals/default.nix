{ config, pkgs, ... }:

{
  imports = [ ./logiops.nix ];

  console.keyMap = "br-abnt2";

  services.xserver.xkb = {
    layout = "br,us";
    variant = ",intl";
  };

  systemd.services.logiops = {
    description = "Logitech Configuration Daemon";
    startLimitIntervalSec = 0;
    after = [ "graphical.target" ];
    wantedBy = [ "graphical.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.logiops}/bin/logid";
      User = "root";
      Restart = "on-failure";
      RestartSec = "5s";
    };

    restartTriggers = [
      config.environment.etc."logid.cfg".source
    ];
  };

}
