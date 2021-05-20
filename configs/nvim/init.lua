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
vim.o.hidden = true
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.wildmode = 'longest,full'
vim.o.guifont = 'Fira_Code:h18'
vim.cmd([[
  set iskeyword+=-
]])

-- emacs key for commnad line
vim.cmd([[
  " recall newer command-line
  :cnoremap <C-N>		<Down>
  " recall previous (older) command-line
  :cnoremap <C-P>		<Up>
  " back one word
  :cnoremap <M-b>	<S-Left>
  " forward one word
  :cnoremap <M-f>	<S-Right>
]])

api.nvim_set_keymap('t', '<Esc>',  '<c-\\><c-n>', { noremap = true })

local abbrev_file="~/.config/nvim/abbrev.vim"
if vim.fn.findfile(abbrev_file) ~= '' then
    vim.cmd('source ' .. abbrev_file)
end

if vim.fn.executable("rg") then
  vim.o.grepprg = 'rg --vimgrep --smart-case --follow'
end
vim.cmd("command! -bar -bang -complete=file -nargs=+ Fd lua Grep(<q-bang>, <q-args>, 'fd -t f', '%f')")
vim.cmd("command! -bar -bang -complete=file -nargs=* Ls lua Grep(<q-bang>, <q-args>, 'ls', '%f')")
vim.cmd("command! -bar -bang -complete=file -nargs=+ Rg lua Grep(<q-bang>, <q-args>, 'rg --vimgrep --smart-case --follow', vim.o.grepformat)")
function Grep(bang, args, prg, fmt)
    local grepprg = vim.o.grepprg
    local grepformat = vim.o.grepformat
    vim.o.grepprg = prg
    vim.o.grepformat = fmt

    vim.cmd('grep' .. bang .. ' ' .. args)

    vim.o.grepprg = grepprg
    vim.o.grepformat = grepformat

    if bang ~= '' and #vim.fn.getqflist() > 1 then
        vim.cmd('copen')
    end
end

require('plugins')
