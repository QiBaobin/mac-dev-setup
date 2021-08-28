return require('packer').startup({
  function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fundamental
    use 'tpope/vim-sensible'
    use 'tpope/vim-sleuth'
    use { 'tpope/vim-fugitive', config = function() 
      vim.api.nvim_set_keymap('n', '<Leader>g',  ':Git | only<CR>gg<c-n>', { noremap = true })
    end }
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-rsi'

    use 'AndrewRadev/splitjoin.vim'
    use 'wellle/targets.vim'
    use { "folke/which-key.nvim", config = function() require("which-key").setup {} end }
    use 'QiBaobin/neovim-shelljob'

    -- code
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
      require'nvim-treesitter.configs'.setup {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        highlight = { enable = true },
        indent = { enable = true }
      }
    end }
    use { 'neovim/nvim-lspconfig', config = function() require 'lsp-setup' end }
    use 'pechorin/any-jump.vim'

    -- UI
    use { "Pocco81/Catppuccino.nvim", config  = function()
      local catppuccino = require("catppuccino")

      -- configure it
      catppuccino.setup(
        {
          colorscheme = "catppuccino",
          transparency = false,
          styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "NONE",
          },
          integrations = {
            treesitter = true,
            native_lsp = {
              enabled = true,
              styles = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic"
              }
            },
            which_key = true,
            bufferline = true,
          }
        }
      )

      -- load it
      catppuccino.load()

    end }
    use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true }, config = function()
      require('lualine').setup{ options = {theme = 'catppuccino'} }
    end }
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config = function()
      require('bufferline').setup { options = { show_buffer_close_icons = false, tab_size=8 } }
    end }

  end,
  config = {
    git = {
      depth = 1, -- Git clone depth
      clone_timeout = 300, -- Timeout, in seconds, for git clones
    }}
})
