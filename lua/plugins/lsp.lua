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
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
        vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
        vim.keymap.set('n', 'go', builtin.lsp_type_definitions, opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        -- vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = lsp_attach,
      })

      lsp.tsserver.setup({
        capabilities = cap,
      })

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
