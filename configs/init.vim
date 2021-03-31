set shiftwidth=4
set relativenumber number
set hidden
let mapleader      = ' '
let maplocalleader = ' '

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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1

Plug 'udalov/kotlin-vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
    let g:LanguageClient_serverCommands = {
	\ 'rust': ['rust-analyzer'],
	\ }
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    autocmd FileType rust nnoremap <buffer> gq :call LanguageClient#textDocument_formatting()<CR>

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()
