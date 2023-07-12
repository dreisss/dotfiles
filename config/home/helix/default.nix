{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

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
        lsp.display-messages = true;
      };

      keys.normal = {
        A-j = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
        A-k = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];

        space.w = {
          v = [ "vsplit" "file_picker" ];
          h = [ "hsplit" "file_picker" ];
        };
      };
    };

    languages = import ./language.nix { };
  };

  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];
}
