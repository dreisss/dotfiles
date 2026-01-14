{ pkgs, ... }:

{
  imports = [
    ./system
    ./packages
    ./peripherals
    ./home.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "ventoy-1.1.07" ];
    };

    overlays = [
      (self: super: {
        unstable = import <nixpkgs-unstable> { config.allowUnfree = true; };

        custom = {
          zen = (builtins.getFlake "github:0xc000022070/zen-browser-flake").packages."${pkgs.stdenv.hostPlatform.system}".default;
          anytype = import ./packages/anytype.nix;
        };
      })
    ];
  };
}

