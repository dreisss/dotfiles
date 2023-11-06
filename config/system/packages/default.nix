{ pkgs, ... }:

let
  stable = import ./stable.nix { inherit pkgs; };
  unstable = import ./unstable.nix { inherit pkgs; };
in
{
  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" ];

  environment.systemPackages = stable.packages ++ unstable.packages;
}
