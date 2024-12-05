return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
      local lsp = require("lspconfig")
      local cap = require("cmp_nvim_lsp").default_capabilities()
      local lsp_attach = function(args)
        local opts = { buffer = args.buf }
        require("config.bindings").Custom_lsp_actions(opts)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = lsp_attach,
      })


      lsp.ts_ls.setup({
        capabilities = cap,
        on_attach = function(client, bufnr)
          -- Change cwd to the project root detected by the LSP
          if client.config.root_dir then
            vim.cmd('cd ' .. client.config.root_dir)
          end
        end,
        root_dir = require('lspconfig').util.root_pattern('package.json', 'tsconfig.json'),
      })

      -- lsp.eslint.setup({
      --   capabilities = cap,
      -- })

      lsp.lua_ls.setup({
        capabilities = cap,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })
      lsp.sqlls.setup({
        capabilities = cap,
      })

      lsp.jsonls.setup({
        capabilities = cap,
        filetypes = { 'json', 'jsonc' },
        settings = {}
      })

      lsp.yamlls.setup({
        capabilities = cap,
        settings = {}
      })


      lsp.rust_analyzer.setup {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false,
            }
          }
        }
      }
    end
  },
}
