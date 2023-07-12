{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      shell = {
        program = "fish";
        args = [ "-l" "-c" "tmux attach || tmux" ];
      };

      window.dimensions = {
        columns = 115;
        lines = 32;
      };

      colors = import ./theme.nix { };

      cursor.style = {
        blinking = "Always";
        shape = "Underline";
      };

      font = {
        normal.family = "Cascadia Code PL";
        offset.y = 2;
        size = 12;
      };
    };
  };
}
