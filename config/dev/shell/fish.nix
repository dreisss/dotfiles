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
      man = "tlrc";
      see = "viu";
      thumb = "~/.cargo/bin/thumb";

      run = "bun run";
      pm = "bun";
      pi = "bun i";
      px = "bunx --bun";

      cr = "crystal";
      crr = "crystal run";

      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix-channel --update";
      clean = "sudo nix-collect-garbage -d; sudo /run/current-system/bin/switch-to-configuration boot";
      temp = "nix-shell --run fish -p";
      dev = "nix-shell";

      restart = "shutdown -r 0";
      quit = "exit";
      q = "exit";
    };

    shellInit = ''
      set fish_greeting
      zoxide init fish | source
      fish_add_path ~/.cargo/bin/
    '';
  };

  # fix cursor on exit helix
  home.file = {
    ".config/fish/functions/hx.fish".text = ''
      function hx
        command hx $argv
        printf '\033[0 q'
      end
    '';

    ".config/fish/functions/fish_user_key_bindings.fish".text = ''
      function fish_user_key_bindings
        if command -s fzf-share >/dev/null
          source (fzf-share)/key-bindings.fish
        end

        fzf_key_bindings
      end
    '';
  };
}
