{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      aws.symbol = "  ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " 󰌾";
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

      format = "$directory$git_branch$git_state$git_status$all$cmd_duration$line_break$nix_shell$character";

      directory.style = "blue";

      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };

      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };

      nix_shell = {
        format = "[nix-shell]($style) ";
        style = "purple";
      };

      character = {
        success_symbol = "[~>](purple)";
        error_symbol = "[~>](red)";
        vimcmd_symbol = "[~>](green)";
      };
    };
  };
}
