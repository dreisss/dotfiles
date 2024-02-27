{ pkgs, lib, ... }:

let node = pkgs.unstable.nodePackages_latest; in
{
  home.packages = lib.flatten (with pkgs.unstable; [
    # language servers
    nil # nix
    marksman # markdown
    emmet-ls
    gopls
    rust-analyzer
    dockerfile-language-server-nodejs
    tailwindcss-language-server

    (with nodePackages_latest; [
      bash-language-server
      yaml-language-server
      vscode-langservers-extracted # html, css, js, json
      typescript-language-server
      pyright
    ])
    node."@astrojs/language-server"
    node."@prisma/language-server"

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
