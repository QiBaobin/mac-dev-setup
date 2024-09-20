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
        vim.keymap.set({ 'n', 'v' }, '<Leader>gb', '<Cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Git blame' })
        vim.keymap.set({ 'n', 'v' }, '<Leader>G', ':<C-u>Gitsigns <C-d>', { buffer = buffer, desc = 'Run Gitsigns command' })
        vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = buffer, desc = 'Run Gitsigns command' })
      end
    end,
  },
}
