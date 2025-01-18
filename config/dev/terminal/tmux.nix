{ pkgs, ... }:

{
  programs.tmux = rec {
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
    terminal = "ghostty";
    shell = "${pkgs.fish}/bin/fish";

    plugins = [
      { plugin = (builtins.getFlake "github:niksingh710/minimal-tmux-status").packages.${pkgs.system}.default; }
    ];

    sensibleOnTop = false;

    extraConfig = ''
      # general
      set -ag terminal-overrides ",xterm*:Tc,xterm*:Se=\e[0 q" # fix color and cursor
      set -g renumber-windows on
      # set -g mouse on
      set -g repeat-time 10
      set -g focus-events on

      # keybinds
      bind q kill-pane
      bind w select-pane -t :.+ 
      bind Space set-option status

      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"

      # theme
      set -g @minimal-tmux-indicator-str " "
      run-shell ${(builtins.elemAt plugins 0).plugin}/share/tmux-plugins/minimal-tmux-status/minimal.tmux
    '';
  };
}
