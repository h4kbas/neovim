local o = vim.opt
local g = vim.g

-- General
g.mapleader = " "
g.background = "light"

o.termguicolors = true
o.cursorline = true

o.swapfile = false
g.nobackup = true
g.nowritebackup = true

-- Enconding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = 'utf-8'

-- Theme
vim.cmd("colorscheme aubervim")

-- Merge clipboard with OS
o.clipboard = 'unnamed'

-- Enable mouse
o.mouse = 'a'

-- Visual
o.ruler = true
o.number = true
o.laststatus = 2

-- Tab width 2 spaces
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

o.laststatus = 2

-- Folding
o.foldlevel = 99
o.foldlevelstart = 99
o.foldclose = 'all'
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldtext = ""



-- Format on save
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
