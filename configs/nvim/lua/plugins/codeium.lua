return {
  "Exafunction/codeium.vim",
  config = function()
    vim.g.codeium_no_map_tab = true
    vim.g.codeium_tab_fallback = ''
    vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  end
}
