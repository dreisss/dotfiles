{ ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.dreisss = { ... }: {
      programs.home-manager.enable = true;

      home = {
        stateVersion = "23.05";

        sessionVariables = {
          EDITOR = "hx";
          BROWSER = "firefox";
          TERMINAL = "alacritty";
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
