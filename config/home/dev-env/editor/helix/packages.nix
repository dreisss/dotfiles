{ pkgs, lib, ... }:

let node = pkgs.unstable.nodePackages_latest; in
{
  home.packages = lib.flatten (with pkgs.unstable; [
    # language servers
    nil # nix
    marksman # markdown
    bash-language-server
    emmet-ls
    gopls
    rust-analyzer
    dockerfile-language-server-nodejs
    tailwindcss-language-server

    (with nodePackages_latest; [
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
    rPackages.formatR

    # other
    node.typescript
  ]);
}
