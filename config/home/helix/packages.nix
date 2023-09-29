{ pkgs, ... }:

let node = pkgs.nodePackages_latest; in
{
  home.packages = (with pkgs; [
    marksman
    node.bash-language-server
    node.prettier

    nil
    nixpkgs-fmt

    rust-analyzer
    rustfmt

    black
    node.pyright

    gopls

    node.vscode-langservers-extracted
    node.typescript-language-server
  ]);
}
