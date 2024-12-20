return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local kind_icons = {
        -- gray
        Text = "  ",

        -- blue
        Method = " 󰆧 ",
        Function = " 󰊕 ",
        Constructor = "  ",
        Event = "  ",

        -- teal
        Field = " 󰇽 ",
        Property = " 󰜢 ",
        EnumMember = "  ",
        Variable = " 󰂡 ",

        -- orange
        Class = " 󰠱 ",
        Module = "  ",
        File = " 󰈙 ",
        Folder = " 󰉋 ",
        Reference = "  ",
        Struct = "  ",

        -- pink
        Interface = "  ",
        Enum = "  ",
        TypeParameter = " 󰅲 ",

        -- purple
        Unit = "  ",
        Value = " 󰎠 ",
        Color = " 󰏘 ",
        Keyword = " 󰌋 ",
        Constant = " 󰏿 ",

        Snippet = "  ",
        Operator = " 󰆕 ",
      }
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert(require("config.bindings").Custom_cmp_actions(cmp_select)),
        enabled = function()
          local context = require("cmp.config.context")

          if vim.bo.filetype == "TelescopePrompt" then
            return false
          end
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
                and not context.in_treesitter_capture("string")
                and not context.in_syntax_group("string")
          end
        end,
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local function get_lsp_completion_context(completion, source)
              local ok, source_name = pcall(function()
                return source.source.client.config.name
              end)
              if not ok then
                return nil
              end
              if source_name == "ts_ls" then
                return completion.detail
              elseif source_name == "gopls" then
                return completion.detail
              end
            end

            vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind

            local source_names = {
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              buffer = "[Buffer]",
              path = "[Path]",
              latex_symbols = "[LaTeX]",
            }

            -- Assign a default source name if not already set
            vim_item.menu = source_names[entry.source.name] or entry.source.name

            local completion_context =
                get_lsp_completion_context(entry.completion_item, entry.source)
            if completion_context ~= nil and completion_context ~= "" then
              vim_item.menu = completion_context
            end

            return vim_item
          end,
          window = {
            documentation = cmp.config.window.bordered(),
          },
        },
        cmp.setup.filetype({ "sql" }, {
          sources = {
            { name = "nvim_lsp" },
            { name = "cmp-dbee" },
            { name = "buffer" },
          },
        })
      })
    end
  },
}
