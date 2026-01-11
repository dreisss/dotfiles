{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      mononoki

      geist-font
    ];
  };
}
