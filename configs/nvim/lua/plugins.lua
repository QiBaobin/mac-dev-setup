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

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'neovim/nvim-lspconfig' }
  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}, config = function() require'navigator'.setup() end }

  -- use { 'vim-airline/vim-airline', config = 'vim.cmd([[let g:airline#extensions#tabline#enabled = 0]])' }
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
