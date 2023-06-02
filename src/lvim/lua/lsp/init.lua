require 'lspconfig'.julials.setup {}

-- require 'lspconfig'.unocss.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { 'astro' },
--   root_dir = function(fname)
--     return require 'lspconfig.util'.root_pattern('uno.config.ts')(fname)
--   end
-- }

-- require 'cmp'.setup {
--   sources = { { name = 'nvim_lsp', trigger_characters = { '-' } } }
-- }

-- require 'lvim.lsp.null-ls.linters'.setup {
--   {
--     command = 'eslint',
--     filetypes = { 'typescript', 'astro' }
--   }
-- }

-- require 'lvim.lsp.null-ls.formatters'.setup {
--   {
--     command = 'prettier',
--     filetypes = { 'typescript', 'astro' },
--   },
-- }

-- require 'lvim.lsp.manager'.setup 'tailwindcss'
