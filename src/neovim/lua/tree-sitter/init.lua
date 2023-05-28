require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'julia' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
