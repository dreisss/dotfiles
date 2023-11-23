{ pkgs, ... }:

{
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-text-editor
    gnome-connections
    # gnome-console
    simple-scan
    pantheon.epiphany
  ]) ++ (with pkgs.gnome; [
    gnome-weather
    gnome-contacts
    gnome-maps
    gnome-logs
    yelp
    geary
    seahorse
  ]);

  documentation.nixos.enable = false;

  services.xserver.excludePackages = with pkgs; [ xterm ];
}
