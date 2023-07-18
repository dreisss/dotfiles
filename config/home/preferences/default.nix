{ pkgs, ... }:

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
        border-radius = 12;
        tweaks = [ "macos" "black" ];
      };
    };

    gtk3.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';

    gtk4.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };

  home.sessionVariables.GTK_THEME = "Orchis-Dark";

  dconf.settings = {
    "org/gnome/shell/extensions/user-theme".name = "Orchis-Dark";

    "org/gnome/mutter".center-new-windows = true;
    "org/gnome/mutter".dynamic-workspaces = true;
    "org/gnome/shell/app-switcher".current-workspace-only = true;
    "org/gnome/desktop/wm/preferences".button-layout = "close,minimize,maximize:appmenu";
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-show-weekday = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = [ "<Super>d" ];
      maximize = [ "<Super>Up" ];
      minimize = [ "<Super><Alt>Down" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
    ];

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      command = "env -u WAYLAND_DISPLAY alacritty";
      binding = "<Super>t";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Explorer";
      command = "nautilus";
      binding = "<Super>e";
    };

    "org/gnome/shell".enabled-extensions = [
      "user-theme@gnome-shell-extensions.gcampax.github.com"
      "dash-to-dock@micxgx.gmail.com"
      "blur-my-shell@aunetx"
      "rounded-window-corners@yilozt"
      "logomenu@aryan_k"
    ];
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.logo-menu
  ];
}
