{ pkgs, lib, ... }:

let
  file = builtins.readFile;
  trim = lib.strings.trim;
  version = trim (file ../nixos-version);
in
{
  imports = [
    <home-manager/nixos>
  ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  environment.variables = {
    EDITOR = "${pkgs.helix}/bin/hx";
  };

  home-manager = {
    useGlobalPkgs = true;

    users.dreisss = { ... }: {
      home = {
        stateVersion = version;
        sessionVariables = {
          EDITOR = "${pkgs.helix}/bin/hx";
          GTK_THEME = "Orchis-Dark";
        };
      };

      imports = [
        ./preferences
        ./dev
      ];
    };
  };
}
