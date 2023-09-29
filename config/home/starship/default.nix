{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      aws.symbol = " ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      # directory.read_only = " 󰌾";
      directory.read_only = " [r]";
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
      # nix_shell.symbol = " ";
      nix_shell.symbol = "nix";
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

      format = "$\{custom.container\}$directory$git_branch$git_state$git_status$all$cmd_duration$line_break$nix_shell$character";

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
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed )]($style)";
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

      line_break.disabled = true;

      character = {
        success_symbol = "[~>](purple)";
        error_symbol = "[~>](red)";
        vimcmd_symbol = "[~>](green)";
      };

      nix_shell.format = "[\\[$symbol:$name\\]]($style) ";

      container.disabled = true;
      custom.container = {
        format = "[@$output]($style) ";
        when = "test $(hostname -s) != $(hostname)";
        command = "hostname -s";
        style = "red";
      };

      package = {
        format = "[\\[$symbol$version\\] ]($style)";
        style = "208";
      };

      rust = {
        format = "[\\[$symbol$version\\] ]($style)";
        style = "red";
      };

      python = {
        format = "[\\[$symbol$pyenv_prefix$version\($virtualenv\)\\] ]($style)";
        style = "yellow";
      };

      bun = {
        format = "[\\[$symbol$version\\] ]($style)";
        style = "red";
        detect_extensions = [ "js" "mjs" "cjs" "ts" "mts" "cts" ];
      };

      nodejs = {
        format = "[\\[$symbol$version\\] ]($style)";
        style = "green";
        detect_extensions = [ ];
        detect_files = [ "package-lock.json" "pnpm-lock.json" ];
        detect_folders = [ ];
      };

      golang = {
        format = "[\\[$symbol$version\\] ]($style)";
        style = "cyan";
      };
    };
  };
}
