{ pkgs, ... }:

let node = pkgs.nodePackages_latest; in
{
  home.packages = (with pkgs; [
    node.prettier
    marksman

    node.bash-language-server
    shfmt

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
