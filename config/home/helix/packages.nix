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
    gopls
    rust-analyzer

    # formatters
    shfmt
    nixpkgs-fmt
    node.prettier
    rustfmt
    black

    # other
    node.typescript
  ];
}
