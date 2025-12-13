{ pkgs, ... }:

{
  documentation.nixos.enable = false;

  services.xserver.excludePackages = with pkgs.kdePackages; [
    ark
    elisa
    gwenview
    kate
    kwallet
    kwalletmanager
    okular
    spectacle
  ] ++ (with pkgs; [
    xterm
  ]);
}
