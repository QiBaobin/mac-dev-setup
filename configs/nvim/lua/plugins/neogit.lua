return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
  },
  keys = {
      { "<Leader>gs", "<Cmd>Neogit<CR>", desc = "Neogit" },
  },
  opts = {}
};
