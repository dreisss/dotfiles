{ pkgs, lib, ... }:

with lib.hm.gvariant;
{
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme.override {
        border-radius = 14;
        tweaks = [ "macos" "black" ];
      };
    };

    gtk3.extraConfig.Settings = ''gtk-application-prefer-dark-theme=1'';
    gtk4.extraConfig.Settings = ''gtk-application-prefer-dark-theme=1'';
  };

  dconf.settings = import ./gsettings.nix { inherit mkTuple; };

  home.file.".XCompose".text = ''
    include "%L"

    <dead_acute> <C> : "Ç"
    <dead_acute> <c> : "ç"
  '';

  home.packages = with pkgs.gnomeExtensions; [
    user-themes
    dash-to-dock
    blur-my-shell
    logo-menu
  ];
}
