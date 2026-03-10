{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "dark:Rose Pine,light:Rose Pine Dawn";
      font-size = 16;
      font-family = "Maple Mono";
      cursor-style = "underline";

      initial-command = "tmux attach";
    };
  };
}
