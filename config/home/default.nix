{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  home-manager = {
    useGlobalPkgs = true;

    users.dreisss = { ... }: {
      programs.home-manager.enable = true;

      home = {
        stateVersion = "23.11";

        sessionVariables = {
          EDITOR = "hx";
          BROWSER = "firefox";
          TERMINAL = "alacritty";

          PRISMA_MIGRATION_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/migration-engine";
          PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
          PRISMA_INTROSPECTION_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/introspection-engine";
          PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
          PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
        };
      };

      imports = [
        ./preferences
        ./alacritty
        ./tmux
        ./fish
        ./starship
        ./git
        ./helix
      ];
    };
  };
}

