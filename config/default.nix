{ ... }:

{
  imports = [
    ./system
    ./packages
    ./home.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      (self: super: {
        unstable = import <nixpkgs-unstable> { config.allowUnfree = true; };

        custom = { };
      })
    ];
  };
}

