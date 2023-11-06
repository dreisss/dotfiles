{ pkgs, ... }:

let
  stable = import ./stable.nix { pkgs = pkgs; };
  unstable = import ./unstable.nix { };
in
{
  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" ];

  environment.systemPackages = stable.packages ++ unstable.packages;
}
