return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			local eslint_config_files = {
				"eslint.config.js",
				"eslint.config.mjs",
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.json",
			}
			local function has_eslint_config(bufnr)
				local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p:h")
				local found = vim.fs.find(eslint_config_files, { path = dir, upward = true })
				return #found > 0
			end
			local function js_ts_formatters(bufnr)
				-- Ensure we have a valid buffer name
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname == "" then
					return { "prettierd" }
				end

				if has_eslint_config(bufnr) then
					return { "eslint_d" }
				end
				return { "prettierd", "prettier", stop_after_first = true }
			end
			conform.setup({
				format_on_save = {
					timeout_ms = 2000,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = js_ts_formatters,
					typescript = js_ts_formatters,
					typescriptreact = js_ts_formatters,
					tsx = js_ts_formatters,
					json = { "prettierd", "prettier", stop_after_first = true },
					jsonc = { "prettierd", "prettier", stop_after_first = true },
				},
			})
		end,
	},
}
