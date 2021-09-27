local vim = vim
local api = vim.api

vim.g.mapleader = " "
vim.g.maplocalleader = ','
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.spell = false
vim.o.spelllang = 'en_us'
vim.o.hlsearch = false
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.inccommand = 'split'
vim.o.hidden = true
vim.o.completeopt = 'menuone,noselect'
vim.o.wildmode = 'longest,full'
vim.opt.dictionary:append("/usr/share/dict/words")
vim.o.guifont = 'Hack_Nerd_Font_Mono_:h18'

local abbrev_file="~/.config/nvim/abbrev.vim"
if vim.fn.findfile(abbrev_file) ~= '' then
    vim.cmd('source ' .. abbrev_file)
end

if vim.fn.executable("rg") then
  vim.o.grepprg = 'rg --vimgrep --smart-case --follow'
end

vim.cmd([[
  set iskeyword+=-

  nnoremap <leader>b :ls!<CR>:buffer 
  nnoremap <leader>B :edit term://just\ --chooser=sk\ --choose<CR>
  nnoremap <leader>f :Fi<C-]><CR>
  nnoremap <leader>s :grep 
  nnoremap <leader>S :grep! 
  nnoremap <leader>p :filter /.git\/index/ browse oldfiles<CR>
  nnoremap <leader><tab> <c-^>

  tnoremap <C-o> <C-\><C-N>
  tnoremap <expr> <C-Q> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  augroup terminal_settings
    autocmd!

    autocmd TermOpen term://* startinsert
    autocmd TermClose term://*nvr* bd! term://*nvr*
  augroup END
]])

require('plugins')
