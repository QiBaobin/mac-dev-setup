return require('packer').startup({
  function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fundamental
    use 'tpope/vim-sensible'
    use 'tpope/vim-sleuth'
    use { 'tpope/vim-fugitive', config = function() 
      vim.api.nvim_set_keymap('', '<Leader>g',  ':Git<CR>gg<c-n>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>d',  ':Gdiffsplit<CR>', { noremap = true })
    end }
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-surround'

    use 'AndrewRadev/splitjoin.vim'
    use 'wellle/targets.vim'
    use 'ggandor/lightspeed.nvim'
    use { "folke/which-key.nvim", config = function() require("which-key").setup {} end }

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
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      }
    end }
    use { 'neovim/nvim-lspconfig', config = function() require 'lsp-setup' end }
    use 'b3nj5m1n/kommentary'
    use 'pechorin/any-jump.vim'

    -- UI
    use { 'matbme/JABS.nvim', config = function()
      vim.api.nvim_set_keymap('n', '<Leader>b',  ':JABSOpen<CR>', { noremap = true })
    end }
    use { 'marko-cerovac/material.nvim', config = function()
        require('material').set()
    end }
    use { 'voldikss/vim-floaterm', config = function()
      vim.cmd([[
        let g:floaterm_width = 0.9
        let g:floaterm_height = 0.9
      ]])
      vim.api.nvim_set_keymap('n', '<Leader>t',  ':FloatermToggle<CR>', { noremap = true })
      vim.api.nvim_set_keymap('t', '<C-]>',  '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })
    end }
    use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true }, config = function()
      require('lualine').setup{
        options = {theme = 'gruvbox'}
      }
    end }

  end,
  config = {
    git = {
      depth = 1, -- Git clone depth
      clone_timeout = 300, -- Timeout, in seconds, for git clones
    }}
})
