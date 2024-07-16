{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      eza_ = "eza --icons -s type --git";
      l = "eza_ -l --git-ignore";
      la = "eza_ -la";
      ls = "eza_ --git-ignore";
      lsa = "eza_ --git-ignore";
      lt = "eza_ -T --git-ignore";
      lta = "eza_ -Ta --git-ignore -I .git";

      cd = "z";
      cp = "xcp";
      rm = "rip";
      cat = "bat";
      grep = "rg";
      diff = "delta";
      find = "fd";
      sed = "sd";
      top = "btop";
      ps = "procs";
      du = "dust";
      # history = "atuin";
    };

    shellInit = ''
      set fish_greeting
      fish_config theme choose "Rosé Pine Moon"
      zoxide init fish | source    
    '';
  };

  # TODO: create a complete plugin to fish based in this
  home.file = {
    ".config/fish/themes/Rosé Pine Dawn.theme".source = "${pkgs.custom.fishPlugins.rose-pine}/themes/Rosé Pine Dawn.theme";
    ".config/fish/themes/Rosé Pine Moon.theme".source = "${pkgs.custom.fishPlugins.rose-pine}/themes/Rosé Pine Moon.theme";
  };
}
