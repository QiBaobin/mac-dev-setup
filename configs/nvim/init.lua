local vim = vim
local api = vim.api

vim.g.mapleader = " "
vim.g.maplocalleader = ','
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.spell = true
vim.o.spelllang = 'en_us'
vim.o.hidden = true
vim.o.completeopt = 'menuone,noinsert,noselect'

api.nvim_set_keymap('c', '<c-n>',  '<down>', { noremap = true })
api.nvim_set_keymap('c', '<c-p>',  '<up>', { noremap = true })

vim.cmd([[
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
Plug 'justinmk/vim-sneak'
  let g:sneak#label = 1

Plug 'udalov/kotlin-vim'
Plug 'QiBaobin/vim-gradle'

Plug 'autozimu/LanguageClient-neovim', {  'branch': 'next',  'do': 'bash install.sh',  }
  function LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
      " note that if you are using Plug mapping you should not use `noremap` mappings.
      nmap <buffer> <LocalLeader>m <Plug>(lcn-menu)
      nmap <buffer> <LocalLeader>r <Plug>(lcn-code-lens-action)
      nmap <buffer> <silent> gd <Plug>(lcn-definition)
      setlocal completefunc=LanguageClient#complete
      setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    endif
  endfunction
  autocmd FileType * call LC_maps()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'AndrewRadev/splitjoin.vim'

Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()
]], false)
vim.cmd('colorscheme gruvbox')

local abbrev_file="~/.config/nvim/abbrev.vim"
if vim.fn.findfile(abbrev_file) ~= '' then
    vim.cmd('source ' .. abbrev_file)
end

if vim.fn.executable("rg") then
  vim.o.grepprg = 'rg --vimgrep --smart-case --follow'
end
vim.cmd("command! -bar -bang -complete=file -nargs=+ Fd lua Grep(<q-bang>, <q-args>, 'fd -t f')")
vim.cmd("command! -bar -bang -complete=file -nargs=+ Rg lua Grep(<q-bang>, <q-args>, 'rg --vimgrep --smart-case --follow')")
function Grep(bang, args, prg)
    local grepprg = vim.o.grepprg
    local grepformat = vim.o.grepformat
    local shellpipe = vim.o.shellpipe

    vim.o.grepprg = prg
    vim.o.grepformat = '%f'
    if shellpipe == '2>&1| tee' or shellpipe == '|& tee' then
      vim.o.shellpipe = "| tee"
    end
    vim.cmd('grep' .. bang .. ' ' .. args)
    vim.o.grepprg = grepprg
    vim.o.grepformat = grepformat
    vim.o.shellpipe = shellpipe

    if bang ~= '' and #vim.fn.getqflist() > 1 then
	vim.cmd('copen')
    end
end
