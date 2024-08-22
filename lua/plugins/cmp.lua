return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local kind_icons = {
        -- gray
        Text = "  ",
        Copilot = "  ",

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
          -- { name = "calc" },
          { name = "copilot", },
          { name = "nvim_lsp" },
          -- { name = "luasnip" },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),

          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<C-Space>"] = cmp.mapping.complete(),
        }),
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
              if source_name == "tsserver" then
                return completion.detail
              elseif source_name == "pyright" or source_name == "vtsls" then
                if completion.labelDetails ~= nil then
                  return completion.labelDetails.description
                end
              elseif source_name == "gopls" then
                -- And this, for the record, is how I inspect payloads
                -- require("ditsuke.utils").logger("completion source: ", completion) -- Lazy-serialization of heavy payloads
                -- require("ditsuke.utils").logger("completion detail added to gopls")
                return completion.detail
              end
            end

            vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind

            local source_names = {
              copilot = "[CPilot]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              latex_symbols = "[LaTeX]",
              calc = "[Calc]",
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
            -- completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
        },
        cmp.setup.filetype({ "sql" }, {
          sources = {
            -- { name = "vim-dadbod-completion" },
            { name = "cmp-dbee" },
            { name = "buffer" },
          },
        })
      })
    end
  },
  { "hrsh7th/cmp-calc" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
}
