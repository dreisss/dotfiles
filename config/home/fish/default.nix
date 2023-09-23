{ ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      cd = "z";
      cp = "xcp";
      rm = "rip";
      cat = "bat";
      grep = "rg";
      diff = "delta";
      find = "fd";

      exa_ = "exa --icons -s type --git";
      l = "exa_ -l --git-ignore -I \"*config*\"";
      la = "exa_ -la";
      ls = "exa_ --git-ignore -I \"*config*\"";
      lsa = "exa_ --git-ignore";
      lt = "exa_ -T --git-ignore -I \"*config*\"";
      lta = "exa_ -Ta --git-ignore -I .git";
    };

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellInit = ''
      zoxide init fish | source
    '';
  };
}
