-- disable builtin plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_spec = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1


-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
vim.opt.cmdheight = 0

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 1

-- expand tab
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- wildmode
vim.opt.wildmode = 'longest:full,full'

-- grep, support only file names
vim.opt.grepformat = "%f:%l:%c:%m,%f"

-- [[ Basic Keymaps ]]
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- register related bindings
vim.keymap.set({ 'n', 'v' }, '<M-d>', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set({ 'n', 'v' }, '<M-c>', '"_c', { desc = 'Change without yanking' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'n', 'v' }, '<leader>T', ':terminal ', { desc = 'Open terminal' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer management
vim.keymap.set({ 'n', 'v' }, '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', ':buffer <C-d>', { desc = 'switch buffer' })

-- quickfix
vim.keymap.set({ 'n', 'v' }, '<leader>qo', '<cmd>copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set({ 'n', 'v' }, '<leader>qc', '<cmd>cclose<CR>', { desc = 'Close quickfix list' })
vim.keymap.set({ 'n', 'v' }, '<leader>qn', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set({ 'n', 'v' }, '<leader>qp', '<cmd>cprevious<CR>', { desc = 'Previous quickfix item' })
vim.keymap.set({ 'n', 'v' }, '<leader>qd', vim.diagnostic.setqflist, { desc = 'Open diagnostic quickfix list' })

-- location list
vim.keymap.set({ 'n', 'v' }, '<leader>lo', '<cmd>lopen<CR>', { desc = 'Open location list' })
vim.keymap.set({ 'n', 'v' }, '<leader>lc', '<cmd>lclose<CR>', { desc = 'Close location list' })
vim.keymap.set({ 'n', 'v' }, '<leader>ln', '<cmd>lnext<CR>', { desc = 'Next location item' })
vim.keymap.set({ 'n', 'v' }, '<leader>lp', '<cmd>lprevious<CR>', { desc = 'Previous location item' })
vim.keymap.set({ 'n', 'v' }, '<leader>ld', vim.diagnostic.setloclist, { desc = 'Open diagnostic location list' })

-- search
vim.keymap.set({ 'n', 'v' }, '<leader>/', ':grep ', { desc = 'Grep in files' })
vim.keymap.set({ 'n', 'v' }, '<leader>f', ':find **/', { desc = 'Find a file' })
vim.keymap.set({ 'n', 'v' }, '<leader>sf', ":grep --no-line-number --no-column --no-filename '.*' <<< $(fd --type f )<Left>", { desc = 'Find files' })

-- command mode bindings
vim.keymap.set('c', '<C-k>', '<Up>')

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'kt', 'kts', 'gradle' },
  callback = function()
    vim.opt_local.makeprg = 'abt -s @'
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'nix',
  callback = function()
    vim.opt_local.makeprg = 'nix'
  end,
})
-- jump to last position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  'folke/lazy.nvim',
   { import = "plugins" },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
