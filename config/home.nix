{ pkgs, version, ... }:

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
        (import ./preferences { inherit pkgs; })
        (import ./dev {})
      ];
    };
  };
}
