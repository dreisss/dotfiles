{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      mononoki
      maple-mono.truetype

      work-sans
      geist-font
      times-newer-roman

      libertine
    ];
  };
}
