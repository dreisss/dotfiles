{ pkgs, lib, ... }:

{
  documentation.nixos.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];

  environment.gnome.excludePackages = lib.flatten (with pkgs; [
    # gnome-console
    gnome-connections
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-text-editor
    gnome-tour
    gnome-weather
    gnome-characters

    pantheon.epiphany
    simple-scan
    geary
    seahorse
    yelp
  ]);
}
