{ pkgs, ... }:

{
  imports = [ ./packages.nix ];

  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        true-color = true;
        color-modes = true;
        cursorline = true;
        scrolloff = 15;
        rulers = [ 80 120 ];

        file-picker.hidden = false;
        indent-guides.render = true;

        cursor-shape = {
          insert = "bar";
          select = "underline";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };

      keys = {
        normal = {
          left = [ "no_op" ];
          down = [ "no_op" ];
          up = [ "no_op" ];
          right = [ "no_op" ];

          A-h = [ "unindent" ];
          A-j = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
          A-k = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
          A-l = [ "indent" ];

          X = [ "extend_line_up" "extend_to_line_bounds" ];
          A-x = [ "extend_to_line_bounds" ];

          space.w = {
            minus = [ "hsplit" ];
            "=" = [ "vsplit" ];
          };
        };

        insert = {
          left = [ "no_op" ];
          down = [ "no_op" ];
          up = [ "no_op" ];
          right = [ "no_op" ];
        };

        select = {
          left = [ "no_op" ];
          down = [ "no_op" ];
          up = [ "no_op" ];
          right = [ "no_op" ];

          X = [ "extend_line_up" "extend_to_line_bounds" ];
          A-x = [ "extend_to_line_bounds" ];
        };

      };
    };

    languages = import ./languages.nix { };
  };
}
