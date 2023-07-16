{ ... }:

{
  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "https";
      editor = "hx";
      prompt = "enabled";
      pager = "delta";
    };
  };
}
