return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'java',
      'kotlin',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'nix',
      'python',
      'query',
      'regex',
      'rust',
      'vim',
      'vimdoc',
      'zig',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = { enable = true, },
    indent = { enable = true, },
    incremental_selection = { enable = true, },
    textobjects = { enable = true },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
  end,
}
