{ ... }:

{
  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
      editor = "hx";
      prompt = "enabled";
      pager = "delta";
    };
  };
}
