return require('packer').startup({
  function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fundamental
    use 'tpope/vim-sensible'
    use 'tpope/vim-sleuth'
    use { 'tpope/vim-fugitive', config = function() 
      vim.api.nvim_set_keymap('n', '<Leader>g',  ':Git<CR>gg<c-n>', { noremap = true })
    end }
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-rsi'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-abolish'

    use 'AndrewRadev/splitjoin.vim'
    use 'wellle/targets.vim'
    use { "folke/which-key.nvim", config = function() require("which-key").setup {} end }
    use 'QiBaobin/neovim-shelljob'
    use { 'nvim-telescope/telescope.nvim', config =  function()
      require('telescope').setup{
        defaults = {
          layout_strategy='bottom_pane',
          layout_config = {
            vertical = { width = 0.8 },
            bottom_pane = { height = 0.6 },
          },
        },
        pickers = {
          find_files = { previewer = false, },
        },
      }
      
      vim.api.nvim_set_keymap('n', '<Leader>f',  ':Telescope find_files<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>b',  ':Telescope buffers sort_mru=true<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>s',  ':Telescope grep_string use_regex=true search=', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>S',  ':Telescope grep_string<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>h',  ':Telescope help_tags<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>:',  ':Telescope command_history<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>t',  ':Telescope<CR>', { noremap = true })
    end, requires = {'nvim-lua/plenary.nvim'} }
    use { 'nvim-telescope/telescope-project.nvim', config =  function()
      require'telescope'.load_extension('project')
      vim.api.nvim_set_keymap('n', '<Leader>p',  ':Telescope project<CR>', { noremap = true })
    end }
    use { 'nvim-telescope/telescope-fzy-native.nvim', config =  function()
      require('telescope').load_extension('fzy_native')
    end}

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
    -- use 'vim-test/vim-test'

    -- UI
    use { "Pocco81/Catppuccino.nvim", config  = function()
      local catppuccino = require("catppuccino")

      -- configure it
      catppuccino.setup(
        {
          colorscheme = "dark_catppuccino",
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
      require('bufferline').setup { options = { show_buffer_close_icons = false, tab_size = 8 } }
    end }

  end,
  config = {
    git = {
      depth = 1, -- Git clone depth
      clone_timeout = 300, -- Timeout, in seconds, for git clones
    }}
})
