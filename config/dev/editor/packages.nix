{ pkgs, lib, ... }:

let node = pkgs.unstable.nodePackages_latest; in
{
  home.packages = lib.flatten (with pkgs.unstable; [
    # language servers
    nil
    nixd
    marksman # markdown
    bash-language-server
    texlab
    tex-fmt
    emmet-ls
    gopls
    rust-analyzer
    dockerfile-language-server-nodejs
    tailwindcss-language-server
    stylelint
    stylelint-lsp

    (with nodePackages_latest; [
      yaml-language-server
      vscode-langservers-extracted # html, css, js, json
      typescript-language-server
      pyright
    ])
    node."@astrojs/language-server"

    # formatters
    shfmt
    nixpkgs-fmt
    node.prettier
    biome
    rustfmt
    black

    # other
    node.typescript
  ]);
}
