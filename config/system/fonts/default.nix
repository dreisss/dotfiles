{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      cascadia-code
      unstable.monaspace

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
