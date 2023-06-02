-- General
lvim.builtin.terminal.open_mapping = '<c-t>'

-- Which Key
lvim.builtin.which_key.mappings['w'] = {
  name = 'Window',
  h = { '<cmd>split<cr>', 'Horizontal split' },
  v = { '<cmd>vsplit<cr>', 'Vertical split' },
  q = { '<cmd>q<cr>', 'Close window' },
}

-- Normal Mode
lvim.lsp.buffer_mappings.normal_mode['gs'] = nil
lvim.lsp.buffer_mappings.normal_mode['gl'] = nil

lvim.keys.normal_mode['gg'] = 'gg'
lvim.keys.normal_mode['ge'] = 'G'
lvim.keys.normal_mode['gh'] = '0'
lvim.keys.normal_mode['gl'] = '$'
lvim.keys.normal_mode['gs'] = '_'

-- Visual Model
lvim.lsp.buffer_mappings.visual_mode['gs'] = nil
lvim.lsp.buffer_mappings.visual_mode['gl'] = nil

lvim.keys.visual_mode['gg'] = 'gg'
lvim.keys.visual_mode['ge'] = 'G'
lvim.keys.visual_mode['gh'] = '0'
lvim.keys.visual_mode['gl'] = '$'
lvim.keys.visual_mode['gs'] = '_'
