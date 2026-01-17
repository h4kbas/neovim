return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
      local cap = require("cmp_nvim_lsp").default_capabilities()
      local lsp_attach = function(args)
        local opts = { buffer = args.buf }
        require("config.bindings").Custom_lsp_actions(opts)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = lsp_attach,
      })


      vim.lsp.config("ts_ls", {
        capabilities = cap,
        on_attach = function(client, bufnr)
          -- Change cwd to the project root detected by the LSP
          if client.config.root_dir then
            vim.cmd('cd ' .. client.config.root_dir)
          end
        end,
        root_dir = require('lspconfig.util').root_pattern('package.json', 'tsconfig.json'),
      })
      vim.lsp.enable("ts_ls")

      -- vim.lsp.config("eslint", {
      --   capabilities = cap,
      -- })
      -- vim.lsp.enable("eslint")

      vim.lsp.config("lua_ls", {
        capabilities = cap,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("sqlls", {
        capabilities = cap,
      })
      vim.lsp.enable("sqlls")

      vim.lsp.config("jsonls", {
        capabilities = cap,
        filetypes = { 'json', 'jsonc' },
        settings = {}
      })
      vim.lsp.enable("jsonls")

      vim.lsp.config("yamlls", {
        capabilities = cap,
        settings = {}
      })
      vim.lsp.enable("yamlls")

      vim.lsp.config("rust_analyzer", {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false,
            }
          }
        }
      })
      vim.lsp.enable("rust_analyzer")
    end
  },
}
