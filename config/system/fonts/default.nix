{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # general
      inter
      openmoji-color

      # development
      custom.zed-mono
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    fontconfig = {
      hinting.autohint = true;

      defaultFonts = {
        emoji = [ "OpenMoji Color" ];
      };
    };
  };
}
