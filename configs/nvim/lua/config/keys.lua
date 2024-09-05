-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- register related bindings
vim.keymap.set({ 'n', 'v' }, '<M-d>', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set({ 'n', 'v' }, '<M-c>', '"_c', { desc = 'Change without yanking' })

-- terminal
vim.keymap.set({ 'n', 'v' }, '<Leader>!', ':System ', { desc = 'Run a shell command' })
vim.keymap.set({ 'n', 'v' }, '<Leader>::', ':terminal ', { desc = 'Run a shell command in terminal' })
vim.keymap.set({ 'n', 'v' }, '<Leader>:n', '<Cmd>terminal nix run .<CR>', { desc = 'Nix run current directory' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer management
vim.keymap.set({ 'n', 'v' }, '<Leader>bd', '<Cmd>bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set({ 'n', 'v' }, '<Leader>bf', '<Cmd>bfirst<CR>', { desc = 'First buffer' })
vim.keymap.set({ 'n', 'v' }, '<Leader>bl', '<Cmd>blast<CR>', { desc = 'Last buffer' })
vim.keymap.set({ 'n', 'v' }, '<Leader>bQ', '<Cmd>copen<CR>', { desc = 'Open quickfix' })
vim.keymap.set({ 'n', 'v' }, '<Leader>bL', '<Cmd>lopen<CR>', { desc = 'Open location list' })
vim.keymap.set({ 'n', 'v' }, '<Leader>bN', function ()
  require('mini.notify').show_history()
  vim.api.nvim_command('$')
end, { desc = 'Open notification history' })
vim.keymap.set({ 'n', 'v' }, '<Leader>b!', ':buffer term://*:<C-r>=getenv("SHELL")<CR><CR>', { desc = 'Goto the interactive terminal buffer' })
vim.keymap.set({ 'n', 'v' }, '<Leader><Leader>', '<Cmd>buffers<CR>:buffer ', { desc = 'switch buffer' })
vim.keymap.set({ 'n', 'v' }, ']b', '<Cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set({ 'n', 'v' }, '[b', '<Cmd>bprevious<CR>', { desc = 'Previous buffer' })

-- quickfix
vim.keymap.set({ 'n', 'v' }, ']q', '<Cmd>cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set({ 'n', 'v' }, '[q', '<Cmd>cprevious<CR>', { desc = 'Previous quickfix item' })
-- location list
vim.keymap.set({ 'n', 'v' }, ']q', '<Cmd>lnext<CR>', { desc = 'Next location list item' })
vim.keymap.set({ 'n', 'v' }, '[q', '<Cmd>lprevious<CR>', { desc = 'Previous location list item' })

-- search
vim.keymap.set({ 'n', 'v' }, '<Leader>/', ':grep ', { desc = 'Grep in files' })
vim.keymap.set({ 'n', 'v' }, '<Leader>f', ':edit **/', { desc = 'Find a file' })
vim.keymap.set({ 'n', 'v' }, '<Leader>s', ":grep --no-line-number --no-column --no-filename '.*' <<< $(fd --type f )<Left>", { desc = 'Find files' })

-- git
vim.keymap.set({ 'n', 'v' }, '<Leader>gs', '<Cmd>System git status<CR>', { desc = 'Git status' })
vim.keymap.set({ 'n', 'v' }, '<Leader>ga', '<Cmd>System git add -A<CR>', { desc = 'Git add' })
vim.keymap.set({ 'n', 'v' }, '<Leader>gc', ':<C-u>System git commit ', { desc = 'Git commit' })
vim.keymap.set({ 'n', 'v' }, '<Leader>gC', ':<C-u>System git checkout ', { desc = 'Git checkout' })
vim.keymap.set({ 'n', 'v' }, '<Leader>gr', ':<C-u>System git reset --hard ', { desc = 'Git reset' })
vim.keymap.set({ 'n', 'v' }, '<Leader>gf', ':<C-u>System git fetch origin ', { desc = 'Git fetch' })
vim.keymap.set({ 'n', 'v' }, '<Leader>gp', ':<C-u>System git push origin ', { desc = 'Git push' })
vim.keymap.set({ 'n', 'v' }, '<Leader>gP', ':<C-u>System git pull origin ', { desc = 'Git pull' })
vim.keymap.set({ 'n', 'v' }, '<Leader>g:', ':<C-u>System git ', { desc = 'Git command' })
vim.keymap.set({ 'n', 'v' }, '<Leader>g!', ':<C-u>terminal git ', { desc = 'Git command in a new buffer' })

-- command mode bindings
vim.keymap.set('c', '<C-k>', '<Up>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
