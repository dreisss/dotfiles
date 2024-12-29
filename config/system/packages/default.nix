{ pkgs, lib, ... }:

with pkgs; let
  general = [ firefox ];
  dev = [ helix ];
in
{
  environment.systemPackages = lib.flatten [
    general
    dev
  ];
}
