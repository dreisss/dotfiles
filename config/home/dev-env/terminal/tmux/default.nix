{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    newSession = true;
    aggressiveResize = true;
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    clock24 = true;

    escapeTime = 10;
    baseIndex = 1;
    keyMode = "vi";
    shortcut = "Space";
    terminal = "alacritty";
    shell = "${pkgs.fish}/bin/fish";

    plugins = with pkgs.tmuxPlugins; [
      # TODO: add rose pine theme and create plugin
      { plugin = catppuccin; }
    ];

    sensibleOnTop = false;
    extraConfig = ''
      # general
      set -ag terminal-overrides ",xterm*:Tc,xterm*:Se=\e[0 q" # fix color and cursor

      set -g mouse on

      set-option -g renumber-windows on

      set -g repeat-time 10
      set -g focus-events on

      # keybinds
      bind q kill-pane
      
      bind = split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
    '';
  };
}
