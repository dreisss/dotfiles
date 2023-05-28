local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', telescope.find_files)
vim.keymap.set('n', '<leader>f', telescope.git_files)
vim.keymap.set('n', '<leader>b', telescope.buffers)

-- Normal Mode
vim.keymap.set('n', '<leader>E', vim.cmd.Ex)

vim.keymap.set('n', 'd', 'x')
vim.keymap.set('n', 'c', 'xi')
vim.keymap.set('n', 'x', '0v$')

vim.keymap.set('n', 'wc', 'vwhdi')
vim.keymap.set('n', 'wd', 'vwhd')

vim.keymap.set('n', 'gs', '_')
vim.keymap.set('n', 'gl', '$')
vim.keymap.set('n', 'ge', 'G')

vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<leader>wq', '<C-w>q')
vim.keymap.set('n', '<leader>wv', ':vsplit<cr><C-w>w')
vim.keymap.set('n', '<leader>wh', ':split<cr><C-w>w')

-- Insert Mode

-- Visual Mode
vim.keymap.set('v', 'x', 'j$')
vim.keymap.set('v', '%', '<Esc>ggvG')

vim.keymap.set('v', 'gs', '_')
vim.keymap.set('v', 'gl', '$')
vim.keymap.set('v', 'ge', 'G')
