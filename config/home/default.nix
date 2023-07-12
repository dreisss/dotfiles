{ ... }:

{
  imports = [
    <home-manager/nixos>
    ./fonts
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.dreisss = { ... }: {
      programs.home-manager.enable = true;
      home.stateVersion = "23.05";

      imports = [
        ./preferences
        ./fish
        ./starship
        ./git
        ./alacritty
        ./tmux
        ./helix
      ];

      home.sessionVariables = {
        EDITOR = "hx";
        BROWSER = "firefox";
        TERMINAL = "alacritty";
      };
    };
  };
}
