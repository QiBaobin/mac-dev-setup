-- Execute a shell command and notify the output
vim.api.nvim_create_user_command('System', function(opts)
  vim.system(opts.fargs, { text = true }, function(data)
    local output = opts.args .. '\n\n' .. '' .. data.stdout
    if data.code ~= 0 then
      vim.notify(output .. '\nFinished with errors! code: ' .. data.code .. '\n' .. data.stderr, vim.log.levels.ERROR)
    else
      vim.notify(output, vim.log.levels.INFO)
    end
  end)
end, { bang = false, nargs = '+', complete = 'shellcmd' })

-- edit with completion
vim.api.nvim_create_user_command('Edit', function(opts)
    vim.cmd.edit(vim.fn.expand(opts.args))
  end,
  {
    nargs = 1,
    complete = function(ArgLead)
      -- list all files using fd
      return vim.split(vim.system({"fd", "-tf", ArgLead}):wait().stdout, '\n')
    end
  }
)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
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
