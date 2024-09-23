return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = { transparent_background = true },
  init = {
    vim.cmd.colorscheme "catppuccin"
  },
}
