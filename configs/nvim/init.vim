let mapleader = ' '
let maplocalleader = ','
set background=dark

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif
command! -bar -bang -complete=file -nargs=+ Fd exe s:Grep(<q-bang>, <q-args>, 'fd -t f')
function! s:Grep(bang, args, prg) abort
  let grepprg = &l:grepprg
  let grepformat = &l:grepformat
  let shellpipe = &shellpipe
  try
    let &l:grepprg = a:prg
    setlocal grepformat=%f
    if &shellpipe ==# '2>&1| tee' || &shellpipe ==# '|& tee'
      let &shellpipe = "| tee"
    endif
    execute 'grep! '.a:args
    if empty(a:bang) && !empty(getqflist())
      return 'cfirst'
    else
      return ''
    endif
  finally
    let &l:grepprg = grepprg
    let &l:grepformat = grepformat
    let &shellpipe = shellpipe
  endtry
endfunction

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
  nmap   <Leader>g :Git<CR>gg<c-n>
  nnoremap <Leader>d :Gdiffsplit<CR>
Plug 'tpope/vim-commentary'
  map  gc  <Plug>Commentary
  nmap gcc <Plug>CommentaryLine
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
  nnoremap <Leader>: :Dispatch<space>
  nnoremap <Leader>& :Dispatch!<space>
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
  let g:sneak#label = 1

Plug 'udalov/kotlin-vim'
Plug 'QiBaobin/vim-gradle'
  let g:gradle_makeprg='abt\ build'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'liuchengxu/vista.vim'
  let g:vista_default_executive = 'ctags'
  let g:vista_executive_for = {
    \ 'rust': 'nvim_lsp',
    \ }
  nnoremap <Leader>v :Vista<CR>

Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

set relativenumber number
set spell spelllang=en_us
set hidden

colorscheme gruvbox
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>
if !exists("s:autocmd_loaded")
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  let s:rc_backup="~/code/mac-dev-setup/configs/nvim/init.vim"
  if findfile(s:rc_backup) =~# ''
    autocmd BufWritePost $MYVIMRC execute '!cp -v ' . $MYVIMRC . ' ' . s:rc_backup
  endif
  let s:autocmd_loaded = 1
endif

lua require("lsp-setup")
