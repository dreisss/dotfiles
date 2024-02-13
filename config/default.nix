{ ... }:

let
  unstable-pkgs = import <nixos-unstable> {
    config.allowUnfree = true;
  };
in
{
  imports = [
    ./home
    ./system
  ];

  nixpkgs.overlays = [
    (self: super: {
      unstable = unstable-pkgs;
    })
  ];
}

