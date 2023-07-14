{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      cascadia-code

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
