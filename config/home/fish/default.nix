{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      cd = "z";
      cp = "xcp";
      rm = "rip";
      l = "exa -l --icons -s type";
      ls = "exa --icons -s type";
      la = "exa -la --icons -s type";
      lt = "exa -T --git-ignore";
      cat = "bat";
      grep = "rg";
      diff = "delta";
      find = "fd";
    };

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellInit = ''
      zoxide init fish | source
    '';
  };

  home.packages = with pkgs; [
    zoxide
    exa
    bat
    xcp
    rm-improved
    ripgrep
    fd
    delta
  ];
}
