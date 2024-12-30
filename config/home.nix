{ lib, ... }:

let
  file = builtins.readFile;
  trim = lib.strings.trim;
  version = trim (file ../nixos-version); in
{
  imports = [ <home-manager/nixos> ];

  home-manager = {
    useGlobalPkgs = true;

    users.dreisss = { ... }: {
      home = {
        stateVersion = version;
        sessionVariables.GTK_THEME = "Orchis-Dark";
      };

      imports = [
        ./preferences
        ./dev
      ];
    };
  };
}
