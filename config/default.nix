{ pkgs, lib, ... }:

let
  file = builtins.readFile;
  trim = lib.strings.trim;
  version = trim (file ../nixos-version); in
{
  imports = [
    (import ./system { inherit pkgs version; })
    (import ./packages { inherit pkgs lib; })
    (import ./home.nix { inherit pkgs version; })
  ];
}

