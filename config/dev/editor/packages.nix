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
    # rust-analyzer
    ruby-lsp
    rubocop
    solargraph
    dockerfile-language-server
    tailwindcss-language-server
    # crystalline # throwing error when build
    # ameba-ls # throwing error when build

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
