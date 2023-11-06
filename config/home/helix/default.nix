{ ... }:

let unstable = import <nixos-unstable> { }; in
{
  imports = [
    ./packages.nix
  ];

  programs.helix = {
    enable = true;
    package = unstable.helix;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        true-color = true;
        color-modes = true;
        cursorline = true;
        rulers = [ 80 120 ];

        cursor-shape.insert = "bar";
        file-picker.hidden = false;
        indent-guides.render = true;

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };

      keys = {
        normal = {
          A-j = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
          A-k = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];

          space.w = {
            v = [ "vsplit" "file_picker" ];
            h = [ "hsplit" "file_picker" ];
          };

          up = [ "no_op" ];
          down = [ "no_op" ];
          left = [ "no_op" ];
          right = [ "no_op" ];
        };

        insert = {
          up = [ "no_op" ];
          down = [ "no_op" ];
          left = [ "no_op" ];
          right = [ "no_op" ];
        };
      };
    };

    languages = import ./languages.nix { };
  };
}
