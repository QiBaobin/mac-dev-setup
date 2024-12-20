return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  dependencies = { 'echasnovski/mini.clue' },
  event = 'VimEnter',
  config = function()
    require('mini.cursorword').setup()

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
      window = {
        config = {
          width = 'auto',
        },
      };
    })
  end,
}
