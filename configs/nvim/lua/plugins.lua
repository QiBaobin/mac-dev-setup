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
    use 'tpope/vim-abolish'

    use 'AndrewRadev/splitjoin.vim'
    use 'wellle/targets.vim'
    use { "folke/which-key.nvim", config = function() require("which-key").setup {} end }
    use 'ggandor/lightspeed.nvim'
    use 'QiBaobin/neovim-shelljob'
    use {"akinsho/toggleterm.nvim", config = function()
      require("toggleterm").setup{
        open_mapping = [[<c-\>]],
        direction = 'float',
        close_on_exit = true,
      }
      vim.api.nvim_set_keymap('n', '<Leader>m',  ':TermExec cmd="abt -v build"<Left>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>ma',  ':TermExec cmd="./gradlew :app:instGNPD"<Left>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>!',  ':TermExec cmd=""<Left>', { noremap = true })
    end }
    use { 'liuchengxu/vim-clap', run = ':Clap install-binary', config = function()
      vim.api.nvim_command[[
      let g:clap_layout = { 'relative': 'editor' }
      let g:clap_layout = { 'width': '95%', 'row': '3%', 'col': '3%' }
      let g:clap_open_preview = 'on_move'
      let g:clap_provider_all_buffers = {  'source': { -> split(execute('ls!'), "\n") },  'sink': 'e',  'description': 'All buffers includes hidden ones',  }
      ]]
      -- let g:clap_provider_buffers_cur_tab_only = v:true
      vim.api.nvim_set_keymap('n', '<Leader>f',  ':Clap files<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>b',  ':Clap buffers<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>r',  ':Clap recent_files<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>s',  ':Clap dumb_jump ++query=<cword><CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>S',  ':Clap dumb_jump ++query=', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader><Leader>',  ':Clap providers<CR>', { noremap = true })
    end }

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
    use 'pechorin/any-jump.vim'
    use {'williamboman/nvim-lsp-installer', requires = { 'neovim/nvim-lspconfig'}, config = function()
      require 'lsp-setup'
    end }
    use 'vim-test/vim-test'

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
            bufferline = false,
          }
        }
      )

      -- load it
      catppuccino.load()
    end }
    use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true }, config = function()
      require('lualine').setup{ options = {theme = 'catppuccino'} }
    end }
    use { 'norcalli/nvim-colorizer.lua', config = function()
      require'colorizer'.setup()
    end }

  end,
  config = {
    git = {
      depth = 1, -- Git clone depth
      clone_timeout = 300, -- Timeout, in seconds, for git clones
    }}
})
