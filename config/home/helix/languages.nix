{ pkgs, ... }:

{
  language-server = {
    python-lsp = {
      command = "pyright-langserver";
      args = [ "--stdio" ];
    };

    emmet-lsp = {
      command = "emmet-ls";
      args = [ "--stdio" ];
    };

    eslint-lsp = {
      command = "vscode-eslint-language-server";
      args = [ "--stdio" ];

      config = {
        run = "onType";
        validate = "on";
        nodePath = "";
        rulesCustomizations = [ ];

        workingDirectory.mode = "location";
        problems.shortenToSingleLine = false;
        experimental.useFlatConfig = false;

        codeAction = {
          showDocumentation.enable = true;
          disableRuleComment = { enable = true; location = "separateLine"; };
        };
      };
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

    unocss-lsp = {
      command = "unocss-language-server";
      args = [ "--stdio" ];
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
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.json" ]; };
      language-servers = [
        { name = "vscode-json-language-server"; except-features = [ "format" ]; }
        "biome-lsp"
      ];
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
    {
      name = "dockerfile";
      auto-format = true;
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
      formatter = { command = "prettier"; args = [ "--parser" "css" ]; };
      language-servers = [ "vscode-css-language-server" ];
    }
    {
      name = "scss";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "scss" ]; };
      language-servers = [ "vscode-css-language-server" ];
    }
    {
      name = "javascript";
      auto-format = true;
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.ts" ]; };
      language-servers = [
        { name = "typescript-language-server"; except-features = [ "format" ]; }
        "biome-lsp"
      ];
    }
    {
      name = "typescript";
      auto-format = true;
      formatter = { command = "biome"; args = [ "format" "--stdin-file-path" "a.ts" ]; };
      language-servers = [
        { name = "typescript-language-server"; except-features = [ "format" ]; }
        "biome-lsp"
      ];
    }


    # Web Frameworks
    {
      name = "astro";
      auto-format = true;
      formatter = { command = "prettier"; args = [ "--parser" "astro" ]; };
      language-servers = [ "eslint-lsp" "emmet-lsp" "astro-lsp" ];
    }

    # DB
    {
      name = "prisma";
      auto-format = true;
    }
  ];
}
