return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G" },
  keys = {
    { "<leader>gs", "<Cmd>Git<CR>", desc = "Git status" },
    { "<leader>ga", "<Cmd>Git add -A<CR>", desc = "Git add all files" },
    { "<leader>gc", ":Git commit ", desc = "Git commit" },
    { "<leader>gp", ":Git push origin ", desc = "Git push" },
    { "<leader>g:", ":Git ", desc = "Git command" },
  },
}
