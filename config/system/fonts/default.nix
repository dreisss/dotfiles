{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      unstable.monaspace

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
