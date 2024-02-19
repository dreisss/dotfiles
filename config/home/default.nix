{ nixos-version, ... }:

{
  imports = [ <home-manager/nixos> ];

  home-manager = {
    useGlobalPkgs = true;

    users.dreisss = { ... }: {
      programs.home-manager.enable = true;

      home = {
        stateVersion = nixos-version;

        sessionVariables = {
          EDITOR = "hx";
          BROWSER = "firefox";
          TERMINAL = "alacritty";
        };
      };

      imports = [
        ./dev-env
        ./git

        ./preferences
      ];
    };
  };
}

