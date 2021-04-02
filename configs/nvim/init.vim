let mapleader      = ' '
let maplocalleader = ' '
set background=dark

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

call plug#begin('~/.vim/plugged')

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
    nnoremap <silent> <Leader>r :Clap registers<CR>
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
    endfunction
    let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
    let $FZF_DEFAULT_COMMAND='rg --files'
    let $FZF_DEFAULT_OPTS = '-m --bind ctrl-a:select-all'
    nnoremap <silent> <Leader>b :Buffers<CR>
    nnoremap <silent> <Leader>f :Files<CR>
    nnoremap <silent> <Leader>/ :BLines<CR>
    nnoremap <silent> <Leader>' :Marks<CR>
    nnoremap <silent> <Leader>H :Helptags<CR>
    nnoremap <silent> <Leader>hh :History<CR>
    nnoremap <silent> <Leader>h: :History:<CR>
    nnoremap <silent> <Leader>h/ :History/<CR>

Plug 'tpope/vim-fugitive'
    nmap     <Leader>g :Git<CR>gg<c-n>
    nnoremap <Leader>d :Gdiffsplit<CR>
Plug 'tpope/vim-commentary'
    map  gc  <Plug>Commentary
    nmap gcc <Plug>CommentaryLine
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
    nnoremap <Leader>: :Dispatch<space>
    nnoremap <Leader>& :Dispatch!<space>
Plug 'jiangmiao/auto-pairs'

Plug 'udalov/kotlin-vim'
Plug 'QiBaobin/vim-gradle'
    set makeprg=abt\ build

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

set shiftwidth=4
set relativenumber number
set spell spelllang=en_us
set hidden

colorscheme gruvbox
set completeopt=menuone,noinsert,noselect

lua require("lsp-setup")
