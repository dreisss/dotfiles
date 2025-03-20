{ mkTuple }:

{
  # appearence & tweaks
  "org/gnome/shell/extensions/user-theme".name = "Orchis-Dark";

  "org/gnome/mutter".center-new-windows = true;
  "org/gnome/mutter".dynamic-workspaces = true;
  "org/gnome/shell/app-switcher".current-workspace-only = true;
  "org/gnome/desktop/wm/preferences".button-layout = "close,minimize,maximize:appmenu";

  "org/gnome/desktop/input-sources".sources = [
    (mkTuple [ "xkb" "br" ])
    (mkTuple [ "xkb" "us+intl" ])
  ];

  "org/gnome/desktop/peripherals/touchpad" = {
    tap-to-click = true;
    click-method = "default";
  };

  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    clock-show-weekday = true;
  };

  "org/gnome/shell".favorite-apps = [ "Anytype.desktop" "com.mitchellh.ghostty.desktop" "zen.desktop" "org.gnome.Nautilus.desktop" "discord.desktop" ];

  "org/gnome/desktop/background" = {
    color-shading-type = "solid";
    picture-options = "zoom";
    picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/sheet-l.jxl";
    picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/sheet-d.jxl";
    primary-color = "#1a5fb4";
    secondary-color = "#000000";
  };

  # shortcuts
  "org/gnome/settings-daemon/plugins/media-keys".touchpad-toggle = [ "<Super><Shift>t" ];

  "org/gnome/desktop/wm/keybindings" = {
    show-desktop = [ "<Super>d" ];
    minimize = [ "<Super><Shift>j" ];
    unmaximize = [ "<Super>Down" "<Super>j" ];
    maximize = [ "<Super>Up" "<Super>k" ];

    switch-to-workspace-right = [ "<Super><Ctrl>Right" "<Super><Ctrl>l" ];
    switch-to-workspace-left = [ "<Super><Ctrl>Left" "<Super><Ctrl>h" ];
    move-to-workspace-right = [ "<Super><Ctrl><Shift>Right" "<Super><Ctrl><Shift>l" ];
    move-to-workspace-left = [ "<Super><Ctrl><Shift>Left" "<Super><Ctrl><Shift>h" ];
    switch-input-source = [ "<Super><Ctrl><Shift>space" ];
  };

  "org/gnome/settings-daemon/plugins/media-keys".home = [ "<Super>e" ];
  "org/gnome/shell/keybindings".show-screenshot-ui = [ "<Super><Shift>s" ];

  "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
    "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
  ];

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    name = "Terminal";
    command = "ghostty";
    binding = "<Super>t";
  };

  # extensions
  "org/gnome/shell".enabled-extensions = [
    "user-theme@gnome-shell-extensions.gcampax.github.com"
    "dash-to-dock@micxgx.gmail.com"
    "blur-my-shell@aunetx"
    "logomenu@aryan_k"
  ];
}
