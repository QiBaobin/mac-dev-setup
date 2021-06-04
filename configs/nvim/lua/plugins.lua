return require('packer').startup({
function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-sensible'
  use 'tpope/vim-sleuth'
  use { 'tpope/vim-fugitive', config = function() 
    vim.api.nvim_set_keymap('', '<Leader>g',  ':Git<CR>gg<c-n>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader>d',  ':Gdiffsplit<CR>', { noremap = true })
  end }
  use { 'tpope/vim-commentary', config = function()
    vim.api.nvim_set_keymap('', '<Leader>c',  '<Plug>Commentary', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader>cc',  '<Plug>CommentaryLine', { noremap = true })
  end }
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'

  use 'AndrewRadev/splitjoin.vim'
  use 'wellle/targets.vim'
  use "tversteeg/registers.nvim"

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
  use { 'autozimu/LanguageClient-neovim',   branch = 'next',  run = 'bash install.sh' , config = function()
    vim.cmd([[
      let g:LanguageClient_serverCommands = {  'rust': ['rust-analyzer'],  'python': ['pyls'],  }
      function! LC_maps()
        if has_key(g:LanguageClient_serverCommands, &filetype)
          nmap <buffer> <LocalLeader>m <Plug>(lcn-menu)
          nmap <buffer> <LocalLeader>r <Plug>(lcn-code-lens-action)
          nmap <buffer> <LocalLeader>e <Plug>(lcn-explain-error)
          nmap <buffer> <silent> gd <Plug>(lcn-definition)
          setlocal completefunc=LanguageClient#complete
          setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
        endif
      endfunction
      autocmd FileType * call LC_maps()
    ]])
  end }

  use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config = function()
    vim.api.nvim_set_keymap('n', '<Leader>b',  ':BufferLinePick<CR>', { noremap = true })
    require("bufferline").setup{}
  end }
  use { 'morhetz/gruvbox', config = 'vim.cmd([[colorscheme gruvbox]])' }
end,
config = {
  git = {
    depth = 1, -- Git clone depth
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  }}
})
