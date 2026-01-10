{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      mononoki
    ];
  };
}
