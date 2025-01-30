{ pkgs, ... }:

{
  language-server = {
    nixd = {
      command = "nixd";
    };

    python-lsp = {
      command = "pyright-langserver";
      args = [ "--stdio" ];
      config = { };
    };

    emmet-lsp = {
      command = "emmet-ls";
      args = [ "--stdio" ];
    };

    typescript-lsp = {
      command = "typescript-language-server";
      args = [ "--stdio" ];
      config.tsserver.path = "${pkgs.typescript}/lib/node_modules/typescript/lib/";
    };

    biome-lsp = {
      command = "biome";
      args = [ "lsp-proxy" ];
    };

    astro-lsp = {
      command = "astro-ls";
      args = [ "--stdio" ];
      config.typescript.tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib/";
    };

    tailwind-lsp = {
      command = "tailwindcss-language-server";
      args = [ "--stdio" ];
    };

    # TODO: change to biome when css linter is finished https://github.com/biomejs/biome/issues/2511
    stylelint-lsp = {
      command = "stylelint-lsp";
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
      language-servers = [ "nil" "nixd" ];
      formatter.command = "nixpkgs-fmt";
    }
    {
      name = "latex";
      auto-format = true;
      formatter = { command = "tex-fmt"; args = [ "--stdin" ]; };
    }
    {
      name = "rust";
      auto-format = true;
    }
    {
      name = "dockerfile";
      auto-format = true;
    }

    # Data languages
    {
      name = "yaml";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "yaml" ]; };
    }
    {
      name = "json";
      auto-format = true;
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.json" ]; };
      language-servers = [
        { name = "vscode-json-language-server"; except-features = [ "format" ]; }
        "biome-lsp"
      ];
    }

    # Data Science
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
      language-servers = [ "emmet-lsp" "vscode-html-language-server" ];
    }
    {
      name = "css";
      auto-format = true;
      formatter = { command = "bash"; args = [ "-c" "stylelint --stdin --fix | biome format --stdin-file-path a.css" ]; };
      language-servers = [ "vscode-css-language-server" "stylelint-lsp" ];
    }
    {
      name = "scss";
      auto-format = true;
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.css" ]; };
      language-servers = [ "vscode-css-language-server" ];
    }
    {
      name = "javascript";
      auto-format = true;
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.ts" ]; };
      language-servers = [ "typescript-lsp" "biome-lsp" ];
    }
    {
      name = "typescript";
      auto-format = true;
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.ts" ]; };
      language-servers = [ "typescript-lsp" "biome-lsp" ];
    }
    {
      name = "tsx";
      auto-format = true;
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.tsx" ]; };
      language-servers = [ "typescript-lsp" "biome-lsp" "emmet-lsp" "tailwind-lsp" ];
    }

    # Web Frameworks
    {
      name = "astro";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "astro" ]; };
      language-servers = [ "astro-lsp" "biome-lsp" "tailwind-lsp" ];
    }
  ];
}
