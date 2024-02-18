{ pkgs, ... }:

let nixos-version = builtins.readFile ../nixos-version; in
{
  imports = [
    (import ./home { inherit nixos-version; })
    (import ./system { inherit pkgs nixos-version; })
  ];

  nixpkgs.overlays = [
    (self: super: {
      unstable = import <nixos-unstable> { config.allowUnfree = true; };

      custom = {
        zed-mono = import ./custom-packages/fonts/zed-mono.nix;
      };
    })
  ];
}

