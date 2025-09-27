{ ... }:

{
  home.file.".config/ghostty/config".text = ''
    theme = dark:tokyonight,light:tokyonight-day
    font-size = 16
    font-family = "mononoki"
    cursor-style = underline

    initial-command = tmux attach
  '';
}
