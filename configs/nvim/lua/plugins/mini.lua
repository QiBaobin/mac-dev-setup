return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  event = 'VimEnter',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.cursorword').setup()
    require('mini.indentscope').setup()
    require('mini.git').setup()
    vim.keymap.set({ 'n', 'v' }, '<leader>g<space>', '<cmd>lua MiniGit.show_at_cursor()<CR>', { desc = 'Show at cursor' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gC', '<cmd>Git checkout', { desc = 'Checkout' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gP', ':Git pull ', { desc = 'Pull' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gR', ':Git reset ', { desc = 'Reset' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gS', ':Git show ', { desc = 'Show' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ga', '<cmd>Git add .<CR>', { desc = 'Add all' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gb', '<cmd>Git blame %<CR>', { desc = 'Blame' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gc', ':Git commit ', { desc = 'Commit' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gd', '<cmd>Git diff<CR>', { desc = 'Diff' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gf', '<cmd>Git fetch<CR>', { desc = 'Fetch' })
    vim.keymap.set({ 'n', 'v' }, '<leader>go', ':Git log ', { desc = 'Log' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gp', ':Git push ', { desc = 'Push' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gs', '<cmd>Git status<CR>', { desc = 'Status' })

    local miniclue = require('mini.clue')
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- LocalLeader triggers
        { mode = 'n', keys = '<LocalLeader>' },
        { mode = 'x', keys = '<LocalLeader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },

        -- `]` key
        { mode = 'n', keys = ']' },
        { mode = 'x', keys = ']' },

        -- '[' key
        { mode = 'n', keys = '[' },
        { mode = 'x', keys = '[' },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers({ show_contents = true }),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
    })
  end,
}
