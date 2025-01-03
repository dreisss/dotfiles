{ ... }:

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

      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix-channel --update";
      clean = "sudo nix-collect-garbage -d; sudo /run/current-system/bin/switch-to-configuration boot";
    };

    shellInit = ''
      set fish_greeting
      zoxide init fish | source    
    '';
  };
}
