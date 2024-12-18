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
          lines = 33;
        };
      };

      terminal.shell = {
        program = "sh";
        args = [ "-l" "-c" "tmux attach" ];
      };

      cursor.style = {
        blinking = "Always";
        shape = "Underline";
      };

      font = {
        normal.family = "Zed Mono Medium Extended";
        size = 13;
      };

      colors = pkgs.custom.alacritty-rose-pine.dark;
    };
  };
}
