return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
    cmd = { "ToggleTerm", "ToggleTermToggleAll" },
    keys = {
      { "<Leader>t", "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      { "<Leader>T", "<Cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals" },
    }
  }
}
