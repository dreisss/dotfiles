{ ... }:

{
  "org/gnome/shell/extensions/user-theme".name = "Orchis-Dark";

  "org/gnome/mutter".center-new-windows = true;
  "org/gnome/mutter".dynamic-workspaces = true;
  "org/gnome/shell/app-switcher".current-workspace-only = true;
  "org/gnome/desktop/wm/preferences".button-layout = "close,minimize,maximize:appmenu";

  "org/gnome/desktop/peripherals/touchpad" = {
    tap-to-click = true;
    click-method = "default";
  };

  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    clock-show-weekday = true;
  };

  "org/gnome/settings-daemon/plugins/media-keys".touchpad-toggle = [ "<Super><Shift>t" ];

  "org/gnome/desktop/wm/keybindings" = {
    show-desktop = [ "<Super>d" ];
    minimize = [ "<Super><Shift>j" ];

    unmaximize = [ "<Super>Down" "<Super>j" ];
    maximize = [ "<Super>Up" "<Super>k" ];
  };

  "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
    "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
    "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
  ];

  # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
  #   name = "Terminal";
  #   command = "alacritty";
  #   binding = "<Super>t";
  # };

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
    name = "Explorer";
    command = "nautilus";
    binding = "<Super>e";
  };

  "org/gnome/shell".enabled-extensions = [
    "user-theme@gnome-shell-extensions.gcampax.github.com"
    "dash-to-dock@micxgx.gmail.com"
    "blur-my-shell@aunetx"
    "logomenu@aryan_k"
  ];  
}
