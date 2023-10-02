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
      l = "exa_ -l --git-ignore";
      la = "exa_ -la";
      ls = "exa_ --git-ignore";
      lsa = "exa_ --git-ignore";
      lt = "exa_ -T --git-ignore";
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
