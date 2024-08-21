return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls', 'jsonls', 'sqlls', 'bashls' },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
          tsserver = function()
            require("lspconfig").tsserver.setup({})
          end,

          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            })
          end,
        }
      })
    end
  },
}
