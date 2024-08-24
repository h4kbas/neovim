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
