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

local abbrev_file="~/.config/nvim/abbrev.vim"
if vim.fn.findfile(abbrev_file) ~= '' then
    vim.cmd('source ' .. abbrev_file)
end

if vim.fn.executable("rg") then
  vim.o.grepprg = 'rg --vimgrep --smart-case --follow'
end

api.nvim_buf_set_keymap(bufnr, "n", "<leader>l", "<Cmd>lua vim.lsp.codelens.run()<CR>", { silent = true })
vim.cmd([[
  set iskeyword+=-

  " recall newer command-line
  :cnoremap <C-N>		<Down>
  " recall previous (older) command-line
  :cnoremap <C-P>		<Up>
  " back one word
  :cnoremap <M-b>	<S-Left>
  " forward one word
  :cnoremap <M-f>	<S-Right>

  :tnoremap <ESC> <C-\><C-N>
  :tnoremap <expr> <C-Q> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  augroup terminal_settings
    autocmd!

    autocmd TermOpen term://* startinsert
    autocmd TermClose term://*nvr* bd! term://*nvr*
  augroup END
  command! -nargs=0 Fi e term://nvr\ $(sk)
]])

require('plugins')
