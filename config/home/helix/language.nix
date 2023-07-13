{}: {
  language = [
    {
      name = "css";
      auto-format = true;

      formatter = {
        command = "prettier";
        args = [ "--parser" "css" ];
      };
    }
    {
      name = "html";
      auto-format = true;

      formatter = {
        command = "prettier";
        args = [ "--parser" "html" ];
      };
    }
    {
      name = "javascript";
      auto-format = true;

      formatter = {
        command = "prettier";
        args = [ "--parser" "typescript" ];
      };
    }
    {
      name = "markdown";
      auto-format = true;

      formatter = {
        command = "prettier";
        args = [ "--parser" "markdown" ];
      };
    }
    {
      name = "nix";
      auto-format = true;
      formatter.command = "nixpkgs-fmt";
    }
  ];
}
