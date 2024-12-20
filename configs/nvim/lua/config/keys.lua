-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- terminal
vim.keymap.set({ 'n', 'v' }, '<Leader>!', ':terminal ', { desc = 'Run a shell command in terminal' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer management
vim.keymap.set({ 'n', 'v' }, '<Leader>b', '<Cmd>ls<CR>:buffer ', { desc = 'Goto buffer' })
vim.keymap.set({ 'n', 'v' }, '<Leader>B', '<Cmd>ls!<CR>:buffer ', { desc = 'Goto buffer' })
vim.keymap.set({ 'n', 'v' }, '<Leader>d', '<Cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- space line
vim.keymap.set({ 'n' }, '] ', "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = 'Add a space line below' })
vim.keymap.set({ 'n' }, '[ ', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = 'Add a space line above' })

-- search
vim.keymap.set({ 'n', 'v' }, '<Leader>/', ':terminal rg --vimgrep -uu ', { desc = 'Grep in files' })
vim.keymap.set({ 'n', 'v' }, '<Leader>f', ':Edit ', { desc = 'Find a file' })
vim.keymap.set({ 'n', 'v' }, '<Leader>s', ":grep --no-line-number --no-column --no-filename '.*' <<< $(fd --type f )<Left>", { desc = 'Find files' })

-- command mode bindings
vim.keymap.set('c', '<C-k>', '<Up>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<C-]>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-\\><C-R>', "<C-\\><C-o>:put " , { desc = 'put a register content' })

