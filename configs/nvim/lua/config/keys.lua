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
vim.keymap.set({ 'n', 'v' }, ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set({ 'n', 'v' }, '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })

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
vim.keymap.set({ 'n', 'v' }, '<leader>s', ":grep --no-line-number --no-column --no-filename '.*' <<< $(fd --type f )<Left>", { desc = 'Find files' })

-- command mode bindings
vim.keymap.set('c', '<C-k>', '<Up>')
