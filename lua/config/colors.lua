-- Define your custom colors
local colors = {
  Color0 = '#697098',
  Color1 = '#C3E88D',
  Color2 = '#F78C6C',
  Color3 = '#82AAFF',
  Color4 = '#ffcb6b',
  Color5 = '#c792ea',
  Color6 = '#ff2c83',
  Color7 = '#ffffff',
  Color8 = '#89DDFF',
  Color9 = '#FFFFFF',
  Color10 = '#3E9689',
  Color11 = '#3C323C',
  Color12 = '#f6f6f4',
  Color13 = '#4C3949',
  Color14 = '#b9b9b9',
  Color15 = '#4F384A',
  Color16 = '#625761',
  Color17 = '#C0C7D4',
  Color18 = '#4C3949',

  add_bg = "#616546",        -- diffEditor.insertedTextBackground
  add_border = "#504D44",    -- diffEditor.insertedTextBorder
  remove_bg = "#7B3233",     -- diffEditor.removedTextBackground
  remove_border = "#5F3237", -- diffEditor.removedTextBorder
  -- modify_bg = "#1B1C24",     -- diffEditor.modifiedTextBackground (VS Code doesn't use this directly, so we can adjust or skip this if needed)
  add_fg = "#2EA043",        -- editorGutter.addedBackground
  change_fg = "#FF7518",     -- editorGutter.modifiedBackground
  delete_fg = "#D73A49",     -- editorGutter.deletedBackground
}

vim.api.nvim_set_hl(0, 'Comment', { fg = colors.Color0 })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = colors.Color0 })
vim.api.nvim_set_hl(0, 'NonText', { fg = colors.Color0 })

vim.api.nvim_set_hl(0, 'String', { fg = colors.Color1 })

vim.api.nvim_set_hl(0, 'Number', { fg = colors.Color2 })
vim.api.nvim_set_hl(0, 'Float', { fg = colors.Color2 })

vim.api.nvim_set_hl(0, 'Function', { fg = colors.Color3 })
vim.api.nvim_set_hl(0, 'Macro', { fg = colors.Color3 })
vim.api.nvim_set_hl(0, 'Directory', { fg = colors.Color3 })

vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.Color4 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.Color4 })
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.Color4 })

vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.Color5 })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.Color5 })

vim.api.nvim_set_hl(0, 'Error', { bg = colors.Color6 })

vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.Color8 })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.Color8 })

vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#508A7F' })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = '#508A7F' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = colors.Color18 })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = colors.Color18 })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = colors.Color18 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = colors.Color12 })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colors.Color18 })
vim.api.nvim_set_hl(0, 'Normal', { bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = colors.Color18 })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.Color13 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = colors.Color13 })

vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.Color14 })

vim.api.nvim_set_hl(0, 'TabLine', { bg = colors.Color15 })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = colors.Color15 })

vim.api.nvim_set_hl(0, 'Visual', { bg = colors.Color16 })

vim.api.nvim_set_hl(0, 'Type', { fg = colors.Color17 })


-- Exact VS Code colors

-- Neovim default diff colors
vim.api.nvim_set_hl(0, "DiffAdd", { bg = colors.add_bg })
vim.api.nvim_set_hl(0, "DiffChange", { bg = colors.modify_bg })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = colors.remove_bg })
vim.api.nvim_set_hl(0, "DiffText", { bg = colors.modify_bg })

vim.api.nvim_set_hl(0, "GitSignsAddInline", { bg = colors.add_bg })       -- Inline addition background color
vim.api.nvim_set_hl(0, "GitSignsChangeInline", { bg = colors.change_fg }) -- Inline change background color
vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { bg = colors.delete_fg }) --

-- Gitsigns highlight groups
-- Define the highlight groups for Gitsigns
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.add_fg })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.change_fg })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.delete_fg })
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = colors.change_fg })
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = colors.delete_fg })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = colors.add_fg })

-- Neogit highlight groups
vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = colors.add_bg })
vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = colors.remove_bg })
vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = colors.modify_bg })

vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = colors.add_bg })
vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = colors.remove_bg })
vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = colors.modify_bg })


vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = colors.add_bg })
vim.api.nvim_set_hl(0, "DiffviewDiffChange", { bg = colors.add_bg })
vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = colors.delete_bg })
vim.api.nvim_set_hl(0, "DiffviewDiffText", { bg = colors.modify_bg })
