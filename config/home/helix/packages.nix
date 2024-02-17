{ pkgs, ... }:

let node = pkgs.nodePackages_latest; in
{
  home.packages = with pkgs; [
    # language servers
    nil # nix
    marksman # markdown
    pkgs.unstable.emmet-ls
    node.bash-language-server
    node.yaml-language-server
    node.vscode-langservers-extracted # html, css, js, json
    node.typescript-language-server
    node.pyright
    node."@astrojs/language-server"
    node."@prisma/language-server"
    gopls
    rust-analyzer
    dockerfile-language-server-nodejs

    # formatters
    shfmt
    nixpkgs-fmt
    node.prettier
    biome
    rustfmt
    black

    # other
    node.typescript
  ];
}
