{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      mononoki
      maple-mono.truetype

      geist-font
    ];
  };
}
