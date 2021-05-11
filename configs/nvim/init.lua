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
vim.o.wildmode = 'longest,full'
vim.o.hlsearch = false

api.nvim_set_keymap('c', '<c-n>',  '<down>', { noremap = true })
api.nvim_set_keymap('c', '<c-p>',  '<up>', { noremap = true })
api.nvim_set_keymap('t', '<Esc>',  '<c-\\><c-n>', { noremap = true })

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

require('plugins')
