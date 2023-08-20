{ ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      cd = "z";
      cp = "xcp";
      rm = "rip";
      l = "exa --icons -s type --git -l";
      ls = "exa --icons -s type";
      la = "exa --icons -s type --git -la ";
      lt = "exa -s type --git-ignore -T";
      lta = "exa -s type --git-ignore -Ta --ignore-glob .git";
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
}
