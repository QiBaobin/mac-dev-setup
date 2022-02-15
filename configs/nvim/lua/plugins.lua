return require('packer').startup({
  function()

    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- fundamental
    use 'tpope/vim-sensible'
    use 'tpope/vim-sleuth'
    use { 'tpope/vim-fugitive', config = function()
      vim.api.nvim_set_keymap('n', '<Leader>g',  ':Git<CR>gg<c-n>', { noremap = true })
    end, opt = true, cmd = { "G", "Gwrite" }, keys = {"<Leader>g"} }
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-surround'
    use { 'tpope/vim-commentary', opt = true, keys = "gc" }
    use 'tpope/vim-rsi'
    use 'tpope/vim-rsi'
    use { 'tpope/vim-abolish', opt = true, cmd = "Abolish" }
    use { 'tpope/vim-dispatch', opt = true, cmd = { "Make", "Dispatch", "Make!", "Dispatch!" } }

    use 'wellle/targets.vim'
    use { "folke/which-key.nvim", config = function() require("which-key").setup {} end }
    use { 'QiBaobin/neovim-shelljob', opt = true,  cmd = {"Job"} }
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
    use { 'pechorin/any-jump.vim', opt = true,  keys = "<Leader>j" }
    use { 'williamboman/nvim-lsp-installer', requires = { 'neovim/nvim-lspconfig'}, config = function()
      require 'lsp-setup'
    end }
    use { 'vim-test/vim-test', opt = true, cmd = { "TestFile" } }

    -- UI
    use { "projekt0n/github-nvim-theme", config = function()
      require("github-theme").setup({
        theme_style = "dark",
        sidebars = {"qf", "terminal", "packer"},
      })
    end }
    use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true }, config = function()
      require('lualine').setup{ options = {theme = 'github'} }
    end }

  end,
  config = {
    git = {
      depth = 1, -- Git clone depth
      clone_timeout = 300, -- Timeout, in seconds, for git clones
    }}
})
