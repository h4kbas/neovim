local o = vim.opt
local g = vim.g

-- Set workdir to path
local p = vim.fn.expand("%:p:h")
vim.cmd("cd /" .. string.gsub(p, "oil:///", ""))

-- General
g.mapleader = " "
g.background = "light"

o.termguicolors = true
o.cursorline = true

o.swapfile = false
g.nobackup = true
g.nowritebackup = true

-- Session
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"

-- Permanaent undo
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Enconding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileencodings = 'utf-8'

o.pumheight = 12
o.signcolumn = 'yes:1'

-- Split
o.splitbelow = true
o.splitright = true

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
function _G.MyFoldText()
  return vim.fn.getline(vim.v.foldstart) .. ' ... ' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

o.fillchars:append({ fold = " " })
o.foldtext = 'v:lua.MyFoldText()'