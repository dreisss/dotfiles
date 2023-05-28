return {
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  { 'catppuccin/nvim',                 name = 'catppuccin', },
  { 'nvim-telescope/telescope.nvim',   tag = '0.1.1',       dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },
}
