{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    nil # nix lsp
    nixpkgs-fmt # nix formatter

    marksman # markdown lsp
    rust-analyzer # rust lsp
    rustfmt # rust formatter
    black # python formatter

  ]) ++ (with pkgs.nodePackages_latest; [
    prettier # general formatter
    bash-language-server # bash lsp

    vscode-langservers-extracted # html, css, json and eslint
    typescript-language-server # js and ts
    pyright # python lsp
  ]);
}
