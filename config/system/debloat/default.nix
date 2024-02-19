{ pkgs, lib, ... }:

{
  documentation.nixos.enable = false;
  services.xserver.desktopManager.xterm.enable = false;

  environment.gnome.excludePackages = lib.flatten (with pkgs; [
    # gnome-console
    gnome-tour
    gnome-text-editor
    gnome-connections
    pantheon.epiphany
    simple-scan

    (with gnome; [
      gnome-weather
      gnome-contacts
      gnome-maps
      gnome-logs
      yelp
      geary
      seahorse
    ])
  ]);
}
