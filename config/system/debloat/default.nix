{ pkgs, lib, ... }:

{
  documentation.nixos.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];

  environment.gnome.excludePackages = lib.flatten (with pkgs; [
    # gnome-console
    gnome-tour
    gnome-text-editor
    gnome-connections
    pantheon.epiphany
    simple-scan
    gnome-weather
    gnome-contacts
    gnome-maps
    gnome-logs
    yelp
    geary
    seahorse
  ]);
}
