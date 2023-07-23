{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    nil
    nixpkgs-fmt

    marksman
    rust-analyzer

    nodejs_20
  ]) ++ (with pkgs.nodePackages_latest; [
    pnpm
    prettier

    vscode-langservers-extracted # html, css, json and eslint
    typescript-language-server # js and ts
  ]);
}
