{ ... }:

{
  home.file.".config/ghostty/config".text = ''
    theme = dark:TokyoNight,light:Tokyonight Day
    font-size = 16
    font-family = "mononoki"
    cursor-style = underline

    initial-command = tmux attach
  '';
}
