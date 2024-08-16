return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls', 'jsonls', 'sqlls', 'bashls' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
          -- Custom setup for lua_ls
          ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' }, -- Define the `vim` global for the Lua Language Server
                  },
                },
              },
            })
          end,
        }
      })
    end
  },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
}
