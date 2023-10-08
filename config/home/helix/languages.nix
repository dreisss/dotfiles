{}: {
  language = [
    # Common
    {
      name = "bash";
      auto-format = true;
      formatter = { command = "shfmt"; args = [ "-s" ]; };
    }
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
    {
      name = "rust";
      auto-format = true;
    }
    {
      name = "python";
      auto-format = true;
      formatter = { command = "black"; args = [ "--quiet" "-" ]; };
      language-server = { command = "pyright-langserver"; args = [ "--stdio" ]; };
      config = { };
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
      name = "scss";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "scss" ]; };
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
      formatter = { command = "prettier"; args = [ "--parser" "astro" ]; };
      language-server = { command = "astro-ls"; args = [ "--stdio" ]; };
      config.typescript.tsdk = "/home/dreisss/.bun/install/global/node_modules/typescript/lib/";
    }
    {
      name = "vue";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "vue" ]; };
      language-server = { command = "vue-language-server"; args = [ "--stdio" ]; };
      config.typescript.tsdk = "/home/dreisss/.bun/install/global/node_modules/typescript/lib/";
    }
  ];
}
