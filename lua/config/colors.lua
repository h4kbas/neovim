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
  Color11 = '#3E313C',
  Color12 = '#f6f6f4',
  Color13 = '#4C3949',
  Color14 = '#b9b9b9',
  Color15 = '#4F384A',
  Color16 = '#625761',
  Color17 = '#C0C7D4',
  Color18 = '#616645',
  Color19 = '#665A65',
  Color20 = '#5F3237',
}

vim.api.nvim_set_hl(0, 'Comment', { fg = colors.Color0 })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = colors.Color0 })
vim.api.nvim_set_hl(0, 'NonText', { fg = colors.Color0 })

vim.api.nvim_set_hl(0, 'String', { fg = colors.Color1 })

vim.api.nvim_set_hl(0, 'Number', { fg = colors.Color2 })
vim.api.nvim_set_hl(0, 'Float', { fg = colors.Color2 })

vim.api.nvim_set_hl(0, 'Function', { fg = colors.Color3 })
vim.api.nvim_set_hl(0, 'Macro', { fg = colors.Color3 })

vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.Color4 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.Color4 })
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.Color4 })

vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.Color5 })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.Color5 })

vim.api.nvim_set_hl(0, 'Error', { fg = colors.Color7, bg = colors.Color6 })

vim.api.nvim_set_hl(0, 'Operator', { fg = colors.Color8 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.Color8 })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.Color8 })

vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.Color10, bg = colors.Color9 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colors.Color11, bg = colors.Color9 })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = colors.Color12, bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.Color12, bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = colors.Color12, bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.Color11, bg = colors.Color12 })
vim.api.nvim_set_hl(0, 'PmenuThumb', { fg = colors.Color12, bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.Color12, bg = colors.Color11 })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg = colors.Color12, bg = colors.Color11 })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.Color13 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = colors.Color13 })

vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.Color14 })

vim.api.nvim_set_hl(0, 'TabLine', { fg = colors.Color14, bg = colors.Color15 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = colors.Color14, bg = colors.Color15 })

vim.api.nvim_set_hl(0, 'Visual', { bg = colors.Color16 })

vim.api.nvim_set_hl(0, 'Type', { fg = colors.Color17 })

vim.api.nvim_set_hl(0, 'DiffAdd', { bg = colors.Color18 })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = colors.Color18 })

vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = colors.Color19 })
