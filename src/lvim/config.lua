require 'plugins'
require 'lsp'
require 'custom'

vim.cmd([[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20
  augroup END
  ]])
