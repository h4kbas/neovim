-- Easy access to vim global variables
_G.map = vim.keymap.set
_G.o = vim.opt
_G.g = vim.g

o.shortmess:append("c")
-- Set workdir to path
local p = vim.fn.expand("%:p:h")
-- Grep
vim.cmd("cd /" .. string.gsub(p, "oil:///", ""))
vim.cmd([[set grepprg=rg\ --vimgrep\ --smart-case\ --hidden]])
vim.cmd([[set grepformat=%f:%l:%c:%m]])
vim.cmd([[
  cabbrev Grep copen \| silent! grep!
]])
-- Undo config
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Session
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"

-- General
g.mapleader = " "
g.background = "light"

o.updatetime = 200
o.termguicolors = true
o.cursorline = true

o.swapfile = false
g.nobackup = true
g.nowritebackup = true

-- Enconding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = 'utf-8'


-- Split
o.splitbelow = true
o.splitright = true

o.pumheight = 12
o.signcolumn = 'yes:1'

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
