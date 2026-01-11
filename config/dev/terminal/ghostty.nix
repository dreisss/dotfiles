{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "dark:TokyoNight,light:TokyoNight Day";
      font-size = 16;
      font-family = "mononoki";
      cursor-style = "underline";

      initial-command = "tmux attach";

    };
  };
}
