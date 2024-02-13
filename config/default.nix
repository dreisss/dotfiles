{ ... }:

{
  imports = [
    ./home
    ./system
  ];

  nixpkgs.overlays = [
    (self: super: {
      unstable = import <nixos-unstable> {
        config.allowUnfree = true;
      };

      custom = {
        zed-mono = import ../custom/packages/fonts/zed-mono.nix;
      };
    })
  ];
}

