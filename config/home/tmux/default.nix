{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    clock24 = true;
    aggressiveResize = false;
    sensibleOnTop = false;
    terminal = "alacritty";
    keyMode = "vi";
    shell = "${pkgs.fish}/bin/fish";

    plugins = with pkgs; [{
      plugin = tmuxPlugins.catppuccin;
    }];

    extraConfig = ''
      # general
      set -ag terminal-overrides ",xterm*:Tc,xterm*:Se=\e[0 q" # fix color and cursor

      set -g mouse on

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set -g escape-time 10
      set -g repeat-time 10
      set -g focus-events on

      # keybinds
      set-option -g prefix C-Space
      bind v split-window -h -c "#{pane_current_path}"
      bind h split-window -v -c "#{pane_current_path}"
      bind > swap-pane -D
      bind < swap-pane -U
      bind + break-pane -t :
      bind Tab select-pane -t :.+
    '';
  };
}
