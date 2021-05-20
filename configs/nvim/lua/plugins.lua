return require('packer').startup({
function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-sensible'
  use 'tpope/vim-sleuth'
  use { 'tpope/vim-fugitive', config = function() 
    vim.api.nvim_set_keymap('', '<Leader>g',  ':Git<CR>gg<c-n>', {})
    vim.api.nvim_set_keymap('n', '<Leader>d',  ':Gdiffsplit<CR>', {})
  end}
  use { 'tpope/vim-commentary', config = function()
    vim.api.nvim_set_keymap('', '<Leader>c',  '<Plug>Commentary', {})
    vim.api.nvim_set_keymap('n', '<Leader>cc',  '<Plug>CommentaryLine', {})
  end}
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'

  use 'QiBaobin/vim-gradle'
  use 'sheerun/vim-polyglot'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'autozimu/LanguageClient-neovim',   branch = 'next',  run = 'bash install.sh' , config = function()
    vim.cmd([[
    let g:LanguageClient_serverCommands = {  'rust': ['rust-analyzer'],  'python': ['pyls'],  }
    let $RUST_BACKTRACE = 1
    let g:LanguageClient_loggingLevel = 'WARN'
    let g:LanguageClient_virtualTextPrefix = ''
    let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
    let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

    function LC_maps()
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
  end}

  use 'AndrewRadev/splitjoin.vim'
  use 'wellle/targets.vim'
  use 'airblade/vim-gitgutter'

  use { 'vim-airline/vim-airline', config = 'vim.cmd([[let g:airline#extensions#tabline#enabled = 1]])' }
  use { 'morhetz/gruvbox', config = 'vim.cmd([[colorscheme gruvbox]])' }
  use { 'scrooloose/nerdtree', opt = ture, cmd = { 'NERDTree' } }

end,
config = {
  git = {
    depth = 1, -- Git clone depth
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  }}
})
