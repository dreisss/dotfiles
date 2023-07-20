{}: {
  language = [
    # Common
    {
      name = "markdown";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "markdown" ]; };
    }
    {
      name = "nix";
      auto-format = true;
      formatter.command = "nixpkgs-fmt";
    }


    # Web
    {
      name = "html";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "html" ]; };
    }
    {
      name = "css";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "css" ]; };
    }
    {
      name = "javascript";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "typescript" ]; };
    }
    {
      name = "typescript";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "typescript" ]; };
    }


    # Web Frameworks
    {
      name = "astro";
      auto-format = true;
      language-server = { command = "astro-ls"; args = [ "--stdio" ]; };
      formatter = { command = "prettier"; args = [ "--parser" "astro" ]; };
    }
  ];
}
