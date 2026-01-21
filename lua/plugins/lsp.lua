return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
      local cap = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig_util = require('lspconfig.util')
      
      local lsp_attach = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end
        
        local opts = { buffer = bufnr }
        require("config.bindings").Custom_lsp_actions(opts)
        
        -- Change cwd to the project root detected by the LSP
        if client.config.root_dir then
          vim.cmd('cd ' .. client.config.root_dir)
        end
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = lsp_attach,
      })

      vim.lsp.config("ts_ls", {
        capabilities = cap,
        root_dir = function(bufnr, on_dir)
          local files = vim.fs.find({ 'package.json', 'tsconfig.json' }, {
            path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':p:h'),
            upward = true,
          })
          if #files > 0 then
            on_dir(vim.fn.fnamemodify(files[1], ':p:h'))
          end
        end,
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
        capabilities = cap,
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
