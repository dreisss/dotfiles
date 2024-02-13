{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      custom.zed-mono
      inter

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
