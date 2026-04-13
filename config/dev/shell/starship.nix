{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      format = ''$nix_shell([\(](bright-black)$git_branch$git_status[\)](bright-black) )($package )$directory$character'';
      right_format = "$cmd_duration$all";
      line_break.disabled = true;

      battery.format = " [$symbol$percentage]($style)";
      cmd_duration.format = "[$duration](218)";
      directory.format = "[$read_only]($read_only_style)[$path](purple)";
      git_branch.format = "[$branch(:$remote_branch)](bright-black)";
      nix_shell.format = ''[\[$symbol:$name\]](blue) '';
      package.format = "[$version](yellow)";

      crystal = {
        format = " [\\[cr $version\\]](purple)";
      };

      python = {
        format = " [\\[py $version\\]](yellow)";
      };

      bun = {
        format = " [\\[bun $version\\]](red)";
        detect_extensions = [ "js" "mjs" "cjs" "ts" "mts" "cts" ];
      };

      nodejs = {
        format = "[\\[node $version\\] ]($green)";
        detect_extensions = [ ];
        detect_files = [ "package-lock.json" "pnpm-lock.json" ];
        detect_folders = [ ];
      };

      character = {
        success_symbol = "[>](bold cyan)";
        error_symbol = "[>](bold red)";
      };

      git_status = {
        format = "[(*$conflicted$untracked$modified$staged$renamed$deleted)](218)($ahead_behind$stashed)";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };

      # ----------------
      aws.symbol = " ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      # directory.read_only = " 󰌾";
      directory.read_only = "[r] ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fossil_branch.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = "⌘ ";
      hg_branch.symbol = " ";
      hostname.ssh_symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      # nix_shell.symbol = "nix";
      nodejs.symbol = " ";
      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Windows = "󰍲 ";
      };
      package.symbol = "󰏗 ";
      pijul_channel.symbol = "🪺 ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      spack.symbol = "🅢 ";
    };
  };
}
