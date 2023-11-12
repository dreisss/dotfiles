{ ... }:

{
  language-server = {
    python-lsp = {
      command = "pyright-langserver";
      args = [ "--stdio" ];
      config = { };
    };

    astro-lsp = {
      command = "astro-ls";
      args = [ "--stdio" ];
      config.typescript.tsdk = "/home/dreisss/.bun/install/global/node_modules/typescript/lib/";
    };

    unocss-lsp = {
      command = "unocss-language-server";
      args = [ "--stdio" ];
      config = { };
    };
  };

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
      name = "yaml";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "yaml" ]; };
    }
    {
      name = "json";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "json" ]; };
    }
    {
      name = "rust";
      auto-format = true;
    }
    {
      name = "python";
      auto-format = true;
      formatter = { command = "black"; args = [ "--quiet" "-" ]; };
      language-servers = [ "python-lsp" ];
    }


    # Web
    {
      name = "html";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "html" ]; };
      language-servers = [ "vscode-html-language-server" "unocss-lsp" ];
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
      language-servers = [ "astro-lsp" "unocss-lsp" ];
    }
  ];
}
