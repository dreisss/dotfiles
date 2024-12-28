{ pkgs, lib, ... }:

let nixos-version = lib.strings.trim (builtins.readFile ../nixos-version); in
{
  imports = [
    (import ./home { inherit nixos-version; })
    (import ./system { inherit pkgs nixos-version; })
  ];
  
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (self: super: {
      unstable = import <nixpkgs-unstable> { config.allowUnfree = true; };

      custom = {
        zed-mono = import ./custom-packages/fonts/zed-mono.nix;
        alacritty-rose-pine = import ./custom-packages/alacritty/rose-pine.nix;
        fishPlugins.rose-pine = import ./custom-packages/fish/rose-pine.nix;
      };
    })
  ];
}

