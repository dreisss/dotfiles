{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # zed-mono
      inter

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
