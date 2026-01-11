{ ... }:

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
          anytype = import ./packages/anytype.nix;
        };
      })
    ];
  };
}

