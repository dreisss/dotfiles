{ pkgs, ... }:

{
  programs.dconf.enable = true;

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  users.users.dreisss.extraGroups = [
    "docker"
    "libvirtd"
  ];

  environment.systemPackages = with pkgs; [
    docker-compose
    distrobox
    virt-manager
  ];
}
