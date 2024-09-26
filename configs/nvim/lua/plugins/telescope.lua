return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { '<Leader>b', '<Cmd>lua require("telescope.builtin").buffers({ show_all_buffers = true, ignore_current_buffer = true, sort_mru = true,})<CR>', desc = 'Select a buffer' },
    { '<Leader>o', '<Cmd>lua require("telescope.builtin").oldfiles({ only_cwd = true })<CR>', desc = 'Open an oldfile' },
  },
}
