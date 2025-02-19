return {
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      local conform = require("conform")
      conform.setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 2000,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          lua = { "stylua" },

          python = { "black" },
          rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          tsx = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          jsonc = { "prettierd", "prettier", stop_after_first = true },
        },
        formatters = {
          eslint_d = {
            format_on_save = {
              timeout_ms = 1000,
              lsp_fallback = true,
            },
          }
        }
      })
    end,
  },
}
