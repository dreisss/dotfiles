{ pkgs, lib, ... }:

let version = lib.strings.trim (builtins.readFile ../nixos-version); in
{
  imports = [
    (import ./system { inherit pkgs version; })
  ];
}

