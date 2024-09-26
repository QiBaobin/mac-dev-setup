-- edit with completion
vim.api.nvim_create_user_command('Edit', function(opts)
    vim.cmd.edit(vim.fn.expand(opts.fargs[#opts.fargs]))
  end,
  {
    nargs = '+',
    complete = function(_, CmdLine)
      -- list all files using fd
      return vim.split(vim.system({"sh", "-c", string.gsub(CmdLine, 'Edit', 'fd -tf', 1)}):wait().stdout, '\n')
    end
  }
)

-- buffer switch
vim.api.nvim_create_user_command('Buffer', function(opts)
    vim.cmd.edit(vim.fn.expand(opts.fargs[#opts.fargs]))
  end,
  {
    nargs = '+',
    complete = function(ArgLead)
      local buffers = vim.api.nvim_list_bufs()
      local buffer_names = {}
      for _, buf in ipairs(buffers) do
        local name = buf .. ' ' .. vim.api.nvim_buf_get_name(buf)
        if name:match(ArgLead) then
          table.insert(buffer_names, name)
        end
      end
      return buffer_names
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

-- jump to last position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})
-- put cursor on the last line
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(0), 0})
  end
})
