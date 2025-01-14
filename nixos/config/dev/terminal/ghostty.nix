{ ... }:

{
  home.file.".config/ghostty/config".text = ''
    theme = tokyonight
    font-size = 16
    font-family = "mononoki"
    cursor-style = underline

    initial-command = tmux attach
  '';
}
