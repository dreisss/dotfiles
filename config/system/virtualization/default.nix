{ pkgs, ... }:

{
  virtualisation.docker.enable = true;

  users.users.dreisss.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    distrobox
  ];
}
