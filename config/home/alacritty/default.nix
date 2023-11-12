{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;

    settings = {
      env.TERM = "xterm-256color";

      window = {
        dynamic_padding = true;
        decorations = "none";

        dimensions = {
          columns = 125;
          lines = 35;
        };
      };

      shell = {
        program = "sh";
        args = [ "-l" "-c" "tmux attach" ];
      };

      cursor.style = {
        blinking = "Always";
        shape = "Underline";
      };

      font = {
        normal.family = "Monaspace Neon Medium";
        offset.y = 2;
        size = 12;
      };

      colors = import ./colors.nix { };
    };
  };
}
