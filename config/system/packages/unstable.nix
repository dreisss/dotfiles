{ pkgs }:

{
  packages = (with pkgs.unstable; [
    vscode
    rustc
    cargo
    clippy
    gcc
    bun
    nodejs_20
    go_1_21

    (python3.withPackages (ps: with ps; [
      numpy
      pandas
    ]))
  ]);
}
