local o = vim.opt
local g = vim.g

-- General
g.mapleader = " "
g.background = "light"

o.termguicolors = true
o.swapfile = false
g.nobackup = true 
g.nowritebackup = true

-- Enconding
o.encoding='utf-8'
o.fileencoding='utf-8'
o.fileencodings='utf-8'

-- Theme
vim.cmd("colorscheme aubervim") 

-- Merge clipboard with OS
o.clipboard='unnamed'

-- Enable mouse
o.mouse='a'

-- Visual
o.ruler = true
o.number = true
o.laststatus=2

-- Tab width 2 spaces
o.expandtab = true
o.tabstop = 2
o.softtabstop=2
o.shiftwidth=2

o.laststatus=2
