{ ... }:

let unstable-pkgs = import <nixos-unstable> { }; in
{
  programs.alacritty = {
    enable = true;

    package = unstable-pkgs.alacritty;

    settings = {
      env.TERM = "xterm-256color";

      window = {
        dimensions = {
          columns = 115;
          lines = 32;
        };

        dynamic_padding = true;
      };

      shell = {
        program = "sh";
        args = [ "-l" "-c" "tmux attach || tmux" ];
      };

      cursor.style = {
        blinking = "Always";
        shape = "Underline";
      };

      font = {
        normal.family = "Cascadia Code PL";
        offset.y = 2;
        size = 12;
      };

      colors = import ./colors.nix { };
    };
  };
}
