return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(buffer)
      local gitsigns = require 'gitsigns'
      if not vim.wo.diff then
        vim.keymap.set('n', ']h', function () gitsigns.nav_hunk('next') end, { buffer = buffer, desc = 'Next hunk' })
        vim.keymap.set('n', '[h', function () gitsigns.nav_hunk('prev') end, { buffer = buffer, desc = 'Previous hunk' })
      end
    end,
  },
}
