return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    --    function will be executed to configure the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local map = function(keys, func, desc)
          if func then
            vim.keymap.set('n', keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
          end
        end

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.supports_method('textDocument/completion') and vim.lsp.completion then
          -- Enable auto-completion
          vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        end

        map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        if client and client.supports_method('textDocument/references') then
          map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        end
        if client and client.supports_method('textDocument/implementation') then
          map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        end
        if client and client.supports_method('textDocument/declaration') then
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end
        if client and client.supports_method('textDocument/hover') then
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
        end
        if client and client.supports_method('textDocument/codeLens') then
          map('<Leader>cl', vim.lsp.buf.code_lens, 'Code[l]ens')
        end
        map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
        map('<Leader>cr', vim.lsp.buf.rename, '[R]ename')
        map('<Leader>ca', vim.lsp.buf.code_action, 'Code [A]ction')
        if client and client.supports_method('textDocument/formatting') then
          map('<Leader>cf', vim.lsp.buf.format, '[F]ormat [F]ile')
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lspconfig = require('lspconfig')
    for name, server in pairs({
      clangd = {},
      bashls = {},
      gradle_ls = {},
      zls = {},
      rust_analyzer = {},
      nil_ls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }) do
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      lspconfig[name].setup(server)
    end

    -- setup mason so that we can use it later
    require('mason').setup()
  end,
}
