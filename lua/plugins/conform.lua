return {
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      local conform = require("conform")
      conform.setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          lua = { "stylua" },

          python = { "black" },
          rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
          typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          tsx = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          jsonc = { "prettierd", "prettier", stop_after_first = true },
        },
      })
    end,
  },
}
