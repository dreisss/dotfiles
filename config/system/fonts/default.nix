{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      unstable.monaspace
      # zed-mono

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
